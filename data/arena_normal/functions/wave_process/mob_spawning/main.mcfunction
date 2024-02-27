## 召喚 メイン
#> 処理用データの検索
    # 入場時データをコピー
    data modify storage arena:temp spawning_data.stage_data set from entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.StageData

    # 検索処理実行
    function arena_normal:misc/data_search with storage arena:temp spawning_data.stage_data

    # 結果を格納
    data modify storage arena:temp spawning_data.stage_detail set from storage arena:temp stage_data_searching.out

#> 召喚時のNBT等
# 空データ作成
data modify storage arena:temp spawning_data.macro.mob_nbt set value {}

    # NBT
        # Attributes
        data modify storage arena:temp spawning_data.macro.mob_nbt.Attributes set value [{Base:0d,Name:"minecraft:generic.max_health"},{Base:0d,Name:"minecraft:generic.attack_damage"},{Base:0d,Name:"minecraft:generic.movement_speed"}]

        # Tags
        data modify storage arena:temp spawning_data.macro.mob_nbt.Tags set value ["Arena.Normal-Stage.Mob"]

        # 選択モブのNBTデータをマージ
        data modify storage arena:temp spawning_data.macro.mob_nbt merge from storage arena:temp spawning_data.mob_select.out.data

    # id
    data modify storage arena:temp spawning_data.macro.mob_id set from storage arena:temp spawning_data.mob_select.out.id

#> Attributes
    # 倍率適応前データの取得
    data modify storage arena:temp spawning_data.data_modifying.in.health set from storage arena:temp spawning_data.stage_detail.health
    data modify storage arena:temp spawning_data.data_modifying.in.strength set from storage arena:temp spawning_data.stage_detail.strength
    data modify storage arena:temp spawning_data.data_modifying.in.speed set from storage arena:temp spawning_data.stage_detail.speed

    # 倍率を計算
        # 共有処理
        scoreboard players set #data_modifying.additive Arena.Temp 0
        scoreboard players set #data_modifying.multiplicative Arena.Temp 0

            # 項目ごとに計算
                # 難易度: 加算
                $execute store result score #data_modifying.difficulty Arena.Temp run data get storage arena:assets stage_difficulty[$(difficulty)].multiplier 100
                scoreboard players operation #data_modifying.additive Arena.Temp += #data_modifying.difficulty Arena.Temp
                    
                    # 速度倍率: 早くなりすぎると困るので
                    scoreboard players operation #data_modifying.speed_multiplier Arena.Temp = #data_modifying.additive Arena.Temp

                # ウェーブ: 加算 
                execute store result score #data_modifying.wave Arena.Temp run data get storage arena:temp spawning_data.stage_data.wave 3
                scoreboard players remove #data_modifying.wave Arena.Temp 25

                execute if data storage arena:temp {spawning_data:{stage_data:{Type:"Endless"}}} run scoreboard players operation #data_modifying.additive Arena.Temp += #data_modifying.difficulty Arena.Temp
                
                # 固有値: 乗算
                execute store result score #data_modifying.unique Arena.Temp run data get storage arena:temp spawning_data.mob_select.out.multiplier 100
                scoreboard players operation #data_modifying.multiplicative Arena.Temp += #data_modifying.unique Arena.Temp

                # 一旦精算
                scoreboard players set #data_modifying.percentage Arena.Temp 100

                scoreboard players operation #data_modifying.percentage Arena.Temp += #data_modifying.additive Arena.Temp
                scoreboard players operation #data_modifying.percentage Arena.Temp *= #data_modifying.multiplicative Arena.Temp

                scoreboard players operation #data_modifying.percentage Arena.Temp /= #100 Constant

        # エンドレスのみ処理
            # ウェーブ計算を5 (+1されるため内部的には4) に固定
            execute if data storage arena:temp {spawning_data:{stage_data:{Type:"Endless"}}} run data modify storage arena:temp spawning_data.stage_data.wave set value 4

    # 操作に必要な引数を設定
    execute store result storage arena:temp spawning_data.data_modifying.speed_multiplier float 1 run scoreboard players get #data_modifying.speed_multiplier Arena.Temp
    execute store result storage arena:temp spawning_data.data_modifying.multiplier float 1 run scoreboard players get #data_modifying.percentage Arena.Temp
    execute store result storage arena:temp spawning_data.data_modifying.index int 1 run data get storage arena:temp spawning_data.stage_data.wave 0.9999

    # データ修飾functionを呼び出し
    function arena_normal:wave_process/mob_spawning/data_modifier with storage arena:temp spawning_data.data_modifying

    # 上計算後の値をAttributesに代入

    data modify storage arena:temp spawning_data.macro.mob_nbt.Attributes[{Name:"minecraft:generic.max_health"}].Base set from storage arena:temp spawning_data.data_modifying.out.health
    data modify storage arena:temp spawning_data.macro.mob_nbt.Attributes[{Name:"minecraft:generic.attack_damage"}].Base set from storage arena:temp spawning_data.data_modifying.out.strength
    data modify storage arena:temp spawning_data.macro.mob_nbt.Attributes[{Name:"minecraft:generic.movement_speed"}].Base set from storage arena:temp spawning_data.data_modifying.out.speed

    # Healthを最大値に設定
    data modify storage arena:temp spawning_data.macro.mob_nbt.Health set value 1024.0f

#> Attributesによらない攻撃力
    # エフェクト付与
        # エフェクトを利用するか確認
        execute store success storage arena:temp spawning_data.additional.effect byte 1 if data storage arena:temp {spawning_data:{mob_select.out:{id:"minecraft:guardian"}}}
        execute store success storage arena:temp spawning_data.additional.effect byte 1 if data storage arena:temp {spawning_data:{mob_select.out:{id:"minecraft:elder_guardian"}}}
        execute store success storage arena:temp spawning_data.additional.effect byte 1 if data storage arena:temp {spawning_data:{mob_select.out:{id:"minecraft:blaze"}}}

        # ボーナス値の計算
        execute if data storage arena:temp {spawning_data:{stage_data:{Type:"Normal"}}} store result score #data_modifying.effect Arena.Temp run data get storage arena:temp spawning_data.stage_data.wave 33
        execute if data storage arena:temp {spawning_data:{stage_data:{Type:"Endless"}}} store result score #data_modifying.effect Arena.Temp run data get storage arena:temp spawning_data.stage_data.wave 10
        
        scoreboard players add #data_modifying.effect Arena.Temp 100

        scoreboard players operation #data_modifying.effect Arena.Temp *= #data_modifying.percentage Arena.Temp 
        scoreboard players operation #data_modifying.effect Arena.Temp /= #100 Constant

        # 適用
        execute if data storage arena:temp {spawning_data:{additional:{effect:true}}} run data modify storage arena:temp spawning_data.macro.mob_nbt.active_effects append value {amplifier:0b,id:"minecraft:strength",duration:-1,show_icon:false,show_particles:false}
        execute if data storage arena:temp {spawning_data:{additional:{effect:true}}} store result storage arena:temp spawning_data.macro.mob_nbt.active_effects[-1].amplifier byte 0.0199 run scoreboard players get #data_modifying.effect Arena.Temp

    # 弓持ちモブ: 弓のエンチャント
        # 弓エンチャントを利用するか確認
        execute store success storage arena:temp spawning_data.additional.bow_enchantment byte 1 if data storage arena:temp spawning_data.mob_select.out.data.HandItems[{id:"minecraft:bow"}]

        # ボーナス値の計算
        execute if data storage arena:temp {spawning_data:{stage_data:{Type:"Normal"}}} store result score #data_modifying.bow_enchantment Arena.Temp run data get storage arena:temp spawning_data.stage_data.wave 33
        execute if data storage arena:temp {spawning_data:{stage_data:{Type:"Endless"}}} store result score #data_modifying.bow_enchantment Arena.Temp run data get storage arena:temp spawning_data.stage_data.wave 10
        
        scoreboard players add #data_modifying.bow_enchantment Arena.Temp 100

        scoreboard players operation #data_modifying.bow_enchantment Arena.Temp *= #data_modifying.percentage Arena.Temp 
        scoreboard players operation #data_modifying.bow_enchantment Arena.Temp /= #100 Constant
        
        
        execute if data storage arena:temp {spawning_data:{additional:{bow_enchantment:true}}} unless data storage arena:temp {spawning_data:{mob_select:{out:{data:{HandItems:{tag:{Enchantments:[{id:"minecraft:power"}]}}}}}}} run data modify storage arena:temp spawning_data.mob_select.out.data.HandItems[{id:"minecraft:bow"}].tag.Enchantments set value []
        execute if data storage arena:temp {spawning_data:{additional:{bow_enchantment:true}}} unless data storage arena:temp {spawning_data:{mob_select:{out:{data:{HandItems:{tag:{Enchantments:[{id:"minecraft:power"}]}}}}}}} run data modify storage arena:temp spawning_data.mob_select.out.data.HandItems[{id:"minecraft:bow"}].tag.Enchantments append value {id:"minecraft:power",lvl:0s}

        # ドロップしないように
        execute if data storage arena:temp {spawning_data:{additional:{bow_enchantment:true}}} run data modify storage arena:temp spawning_data.mob_select.out.data.HandDropChances[0] set value -1e40f

        # レベルの適用
        execute if data storage arena:temp {spawning_data:{additional:{bow_enchantment:true}}} store result storage arena:temp spawning_data.mob_select.out.data.HandItems[{id:"minecraft:bow"}].tag.Enchantments[{id:"minecraft:power"}].lvl short 0.01 run scoreboard players get #data_modifying.bow_enchantment Arena.Temp

#> モブの召喚
    # 乱数: 偏角
    execute store result storage arena:temp spawning_data.macro.rotation int 1 run random value 0..359

    # 乱数: 距離
    execute store result storage arena:temp spawning_data.macro.distance float 0.1 run random value 5..9

    # function呼び出し
    function arena_normal:wave_process/mob_spawning/summon with storage arena:temp spawning_data.macro
