## プレイヤー ボスへ攻撃時
# トリガー解除
advancement revoke @s only arena_boss:combat/player_hurt_boss

# 一時タグ追加
tag @s add arena.temp-Attackerplayer

#> 被ダメージの取得・計算
    # Hitboxモブの体力を取得
    execute store result score #bossDamageCalc.DamageTaken arena.temp run data get entity @e[tag=arena.boss.Main.Hitbox,sort=nearest,limit=1] Health 100

    # 最大値からどれだけ減っているか計算
    scoreboard players remove #bossDamageCalc.DamageTaken arena.temp 102400
    scoreboard players operation #bossDamageCalc.DamageTaken arena.temp *= #-1 Constant

    # 防御力値を取得
    execute store result score #bossDamageCalc.Defense-Raw arena.temp run data get entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.arena.boss.EntityData.Defense
    scoreboard players operation #bossDamageCalc.Defense-Division arena.temp = #bossDamageCalc.Defense-Raw arena.temp

    # 除法計算
    scoreboard players add #bossDamageCalc.Defense-Division arena.temp 100

    # ダメージ軽減率を乗算
    scoreboard players operation #bossDamageCalc.DamageTaken arena.temp *= #100 Constant
    scoreboard players operation #bossDamageCalc.DamageTaken arena.temp /= #bossDamageCalc.Defense-Division arena.temp

    # ストレージへ移動
    execute store result storage arena_boss:temp OnAttacked.DamageAmount int 0.01 run scoreboard players get #bossDamageCalc.DamageTaken arena.temp

#> プレイヤーのダメージ記録
execute store result score #bossDamageCalc.intValue arena.temp run data get storage arena_boss:temp OnAttacked.DamageAmount
scoreboard players operation @s arenaboss.playerDealtDamage += #bossDamageCalc.intValue arena.temp

#> おのおのの処理へ分岐
    # 分岐先 ディレクトリ/ファイル名 の設定
    data modify storage arena_boss:temp MacroAssignment.Directory set from entity @e[tag=arena.boss.stage_core,sort=nearest,limit=1] data.arena.boss.StageData.Directory

    data modify storage arena_boss:temp MacroAssignment.Function set value "on_attacked"

    # 実行
    execute as @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] at @s run function arena_boss:type_specific/general/macro_assignment with storage arena_boss:temp MacroAssignment

#> 後処理
    # Hitboxモブの体力調整
    data modify entity @e[tag=arena.boss.Main.Hitbox,sort=nearest,limit=1] Health set value 1024f

    # 計算後ダメージを保存
    execute store result score #bossDamageCalc.Amount arena.temp run data get storage arena_boss:temp OnAttacked.DamageAmount 100
    execute store result score #bossDamageCalc.Health arena.temp run data get entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.arena.boss.EntityData.Health 100

    scoreboard players operation #bossDamageCalc.Health arena.temp -= #bossDamageCalc.Amount arena.temp
    execute store result entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.arena.boss.EntityData.Health int 0.01 run scoreboard players get #bossDamageCalc.Health arena.temp

        # 討伐判定
        execute if score #bossDamageCalc.Health arena.temp matches ..0 as @e[tag=arena.boss.stage_core,sort=nearest,limit=1] at @s run function arena_boss:type_specific/general/killed with entity @s data.arena.boss.StageData

    # ボスバー処理
    data modify storage arena_boss:temp bossbarData.Health set from entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.arena.boss.EntityData.Health
    data modify storage arena_boss:temp bossbarData.HealthMax set from entity @e[tag=arena.boss.stage_core,sort=nearest,limit=1] data.arena.boss.StageData.EntityData.Health

    data modify storage arena_boss:temp bossbarData.Name set from entity @e[tag=arena.boss.stage_core,sort=nearest,limit=1] data.arena.boss.StageData.DisplayData.Name
    data modify storage arena_boss:temp bossbarData.Directory set from entity @e[tag=arena.boss.stage_core,sort=nearest,limit=1] data.arena.boss.StageData.Directory

    function arena_boss:misc/bossbar_modify with storage arena_boss:temp bossbarData

    # 一時タグ除去
    tag @s remove arena.temp-Attackerplayer

