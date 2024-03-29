## 召喚 メイン
#> 処理用データの検索
    # ステージデータをコピー
    data modify storage arena_normal:temp spawning_data.stage_data set from entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.stage_data

    # 検索処理実行
    data modify storage kota_library: array_picker.in set from storage arena:assets stage_data
    data modify storage kota_library: array_picker.index set from storage arena_normal:temp spawning_data.stage_data.mob_type

    function kota_library:storage_modifier/array_picker with storage kota_library: array_picker 

    # 結果を格納
    data modify storage arena_normal:temp spawning_data.mob_data set from storage kota_library: array_picker.out

#> 召喚時のNBT等
# 空データ作成
data modify storage arena_normal:temp spawning_data.macro.mob_nbt set value {}

    # NBT
        # Attributes
        data modify storage arena_normal:temp spawning_data.macro.mob_nbt.Attributes set value [{Base:0d,Name:"minecraft:generic.max_health"},{Base:0d,Name:"minecraft:generic.attack_damage"},{Base:0d,Name:"minecraft:generic.movement_speed"}]

        # Tags
        data modify storage arena_normal:temp spawning_data.macro.mob_nbt.Tags set value ["arena.normal_stage.mob"]

        # 選択モブのNBTデータをマージ
        data modify storage arena_normal:temp spawning_data.macro.mob_nbt merge from storage arena_normal:temp spawning_data.mob_select.out.data

    # Attributes
        # 倍率適応前データの取得
        data modify storage arena_normal:temp spawning_data.data_modifying.in.health set from storage arena_normal:temp spawning_data.mob_data.health
        data modify storage arena_normal:temp spawning_data.data_modifying.in.strength set from storage arena_normal:temp spawning_data.mob_data.strength
        data modify storage arena_normal:temp spawning_data.data_modifying.in.speed set from storage arena_normal:temp spawning_data.mob_data.speed

        # 倍率を計算
            # 計算済みデータを取得
            execute store result score #data_modifying.percentage arena.temp run data get storage arena_normal:temp spawning_data.stage_data.multipliers.base 100
                
            # 固有値を乗算
            execute store result score #data_modifying.mob_specific arena.temp run data get storage arena_normal:temp spawning_data.mob_select.out.multiplier 100
            scoreboard players operation #data_modifying.percentage arena.temp *= #data_modifying.mob_specific arena.temp

            # エンドレスのみ処理
                # ウェーブ計算を5 (+1されるため内部的には4) に固定
                execute if data storage arena_normal:temp {spawning_data:{stage_data:{type:"endless"}}} run data modify storage arena_normal:temp spawning_data.stage_data.wave set value 4

        # 操作に必要な引数を設定
        data modify storage arena_normal:temp spawning_data.data_modifying.speed_multiplier set from storage arena_normal:temp spawning_data.stage_data.multipliers.speed

        execute store result storage arena_normal:temp spawning_data.data_modifying.multiplier float 0.01 run scoreboard players get #data_modifying.percentage arena.temp
        execute store result storage arena_normal:temp spawning_data.data_modifying.index int 1 run data get storage arena_normal:temp spawning_data.stage_data.wave 0.9999

        # データ修飾functionを呼び出し
        function arena_normal:wave_process/mob_spawning/data_modifier with storage arena_normal:temp spawning_data.data_modifying

        # 上計算後の値をAttributesに代入
        data modify storage arena_normal:temp spawning_data.macro.mob_nbt.Attributes[{Name:"minecraft:generic.max_health"}].Base set from storage arena_normal:temp spawning_data.data_modifying.out.health
        data modify storage arena_normal:temp spawning_data.macro.mob_nbt.Attributes[{Name:"minecraft:generic.attack_damage"}].Base set from storage arena_normal:temp spawning_data.data_modifying.out.strength
        data modify storage arena_normal:temp spawning_data.macro.mob_nbt.Attributes[{Name:"minecraft:generic.movement_speed"}].Base set from storage arena_normal:temp spawning_data.data_modifying.out.speed

        # Healthを最大値に設定
        data modify storage arena_normal:temp spawning_data.macro.mob_nbt.Health set value 1024.0f

    # id
    data modify storage arena_normal:temp spawning_data.macro.mob_id set from storage arena_normal:temp spawning_data.mob_select.out.id

#> Attributesによらない攻撃力
    # 計算用 倍率を100除算 (10000 → 100倍値へ)
    scoreboard players operation #data_modifying.percentage arena.temp /= #100 Constant

    # エフェクト付与
        # エフェクトを利用するか確認
        execute store success storage arena_normal:temp spawning_data.additional.effect byte 1 if data storage arena_normal:temp {spawning_data:{mob_select.out:{id:"minecraft:guardian"}}}
        execute store success storage arena_normal:temp spawning_data.additional.effect byte 1 if data storage arena_normal:temp {spawning_data:{mob_select.out:{id:"minecraft:elder_guardian"}}}
        execute store success storage arena_normal:temp spawning_data.additional.effect byte 1 if data storage arena_normal:temp {spawning_data:{mob_select.out:{id:"minecraft:blaze"}}}

        # ボーナス値の計算
        execute if data storage arena_normal:temp {spawning_data:{stage_data:{type:"normal"}}} store result score #data_modifying.effect arena.temp run data get storage arena_normal:temp spawning_data.stage_data.wave 33
        execute if data storage arena_normal:temp {spawning_data:{stage_data:{type:"endless"}}} store result score #data_modifying.effect arena.temp run data get storage arena_normal:temp spawning_data.stage_data.wave 10
        
        scoreboard players add #data_modifying.effect arena.temp 100

        scoreboard players operation #data_modifying.effect arena.temp *= #data_modifying.percentage arena.temp 
        scoreboard players operation #data_modifying.effect arena.temp /= #100 Constant

        # 適用
        execute if data storage arena_normal:temp {spawning_data:{additional:{effect:true}}} run data modify storage arena_normal:temp spawning_data.macro.mob_nbt.active_effects append value {amplifier:0b,id:"minecraft:strength",duration:-1,show_icon:false,show_particles:false}
        execute if data storage arena_normal:temp {spawning_data:{additional:{effect:true}}} store result storage arena_normal:temp spawning_data.macro.mob_nbt.active_effects[-1].amplifier byte 0.0199 run scoreboard players get #data_modifying.effect arena.temp

    # 弓持ちモブ: 弓のエンチャント
        # 弓エンチャントを利用するか確認
        execute store success storage arena_normal:temp spawning_data.additional.bow_enchantment byte 1 if data storage arena_normal:temp spawning_data.mob_select.out.data.HandItems[{id:"minecraft:bow"}]

        # ボーナス値の計算
        execute if data storage arena_normal:temp {spawning_data:{stage_data:{type:"normal"}}} store result score #data_modifying.bow_enchantment arena.temp run data get storage arena_normal:temp spawning_data.stage_data.wave 33
        execute if data storage arena_normal:temp {spawning_data:{stage_data:{type:"endless"}}} store result score #data_modifying.bow_enchantment arena.temp run data get storage arena_normal:temp spawning_data.stage_data.wave 10
        
        scoreboard players add #data_modifying.bow_enchantment arena.temp 100

        scoreboard players operation #data_modifying.bow_enchantment arena.temp *= #data_modifying.percentage arena.temp 
        scoreboard players operation #data_modifying.bow_enchantment arena.temp /= #100 Constant
                
        execute if data storage arena_normal:temp {spawning_data:{additional:{bow_enchantment:true}}} unless data storage arena_normal:temp spawning_data.mob_select.out.data.HandItems[{id:"minecraft:bow"}].tag.Enchantments[{id:"minecraft:power"}] run data modify storage arena_normal:temp spawning_data.macro.mob_nbt.HandItems[{id:"minecraft:bow"}].tag.Enchantments set value []
        execute if data storage arena_normal:temp {spawning_data:{additional:{bow_enchantment:true}}} unless data storage arena_normal:temp spawning_data.mob_select.out.data.HandItems[{id:"minecraft:bow"}].tag.Enchantments[{id:"minecraft:power"}] run data modify storage arena_normal:temp spawning_data.macro.mob_nbt.HandItems[{id:"minecraft:bow"}].tag.Enchantments append value {id:"minecraft:power",lvl:0s}

        # ドロップしないように
        execute if data storage arena_normal:temp {spawning_data:{additional:{bow_enchantment:true}}} run data modify storage arena_normal:temp spawning_data.macro.mob_nbt.HandDropChances[0] set value -1e40f

        # レベルの適用
        execute if data storage arena_normal:temp {spawning_data:{additional:{bow_enchantment:true}}} store result storage arena_normal:temp spawning_data.macro.mob_nbt.HandItems[{id:"minecraft:bow"}].tag.Enchantments[{id:"minecraft:power"}].lvl short 0.01 run scoreboard players get #data_modifying.bow_enchantment arena.temp

#> モブの召喚
    # 乱数: 偏角
    execute store result storage arena_normal:temp spawning_data.macro.rotation int 1 run random value 0..359

    # 乱数: 距離
    execute store result storage arena_normal:temp spawning_data.macro.distance float 0.1 run random value 5..9

    # function呼び出し
    function arena_normal:wave_process/mob_spawning/summon with storage arena_normal:temp spawning_data.macro
