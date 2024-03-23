## プレイヤー ボスへ攻撃時
# トリガー解除
advancement revoke @s only arena_boss:combat/player_hurt_boss

# 一時タグ追加
tag @s add Arena.Temp-AttackerPlayer

#> 被ダメージの取得・計算
    # Hitboxモブの体力を取得
    execute store result score #bossDamageCalc.DamageTaken Arena.Temp run data get entity @e[tag=arena.boss.Main.Hitbox,sort=nearest,limit=1] Health 100

    # 最大値からどれだけ減っているか計算
    scoreboard players remove #bossDamageCalc.DamageTaken Arena.Temp 102400
    scoreboard players operation #bossDamageCalc.DamageTaken Arena.Temp *= #-1 Constant

    # 防御力値を取得
    execute store result score #bossDamageCalc.Defense-Raw Arena.Temp run data get entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.Arena.boss.EntityData.Defense
    scoreboard players operation #bossDamageCalc.Defense-Division Arena.Temp = #bossDamageCalc.Defense-Raw Arena.Temp

    # 除法計算
    scoreboard players add #bossDamageCalc.Defense-Division Arena.Temp 100

    # ダメージ軽減率を乗算
    scoreboard players operation #bossDamageCalc.DamageTaken Arena.Temp *= #100 Constant
    scoreboard players operation #bossDamageCalc.DamageTaken Arena.Temp /= #bossDamageCalc.Defense-Division Arena.Temp

    # ストレージへ移動
    execute store result storage arena_boss:temp OnAttacked.DamageAmount int 0.01 run scoreboard players get #bossDamageCalc.DamageTaken Arena.Temp

#> プレイヤーのダメージ記録
execute store result score #bossDamageCalc.intValue Arena.Temp run data get storage arena_boss:temp OnAttacked.DamageAmount
scoreboard players operation @s Arenaboss.PlayerDealtDamage += #bossDamageCalc.intValue Arena.Temp

#> おのおのの処理へ分岐
    # 分岐先 ディレクトリ/ファイル名 の設定
    data modify storage arena_boss:temp MacroAssignment.Directory set from entity @e[tag=arena.boss.Stage-Core,sort=nearest,limit=1] data.Arena.boss.StageData.Directory

    data modify storage arena_boss:temp MacroAssignment.Function set value "on_attacked"

    # 実行
    execute as @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] at @s run function arena_boss:type_specific/general/macro_assignment with storage arena_boss:temp MacroAssignment

#> 後処理
    # Hitboxモブの体力調整
    data modify entity @e[tag=arena.boss.Main.Hitbox,sort=nearest,limit=1] Health set value 1024f

    # 計算後ダメージを保存
    execute store result score #bossDamageCalc.Amount Arena.Temp run data get storage arena_boss:temp OnAttacked.DamageAmount 100
    execute store result score #bossDamageCalc.Health Arena.Temp run data get entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.Arena.boss.EntityData.Health 100

    scoreboard players operation #bossDamageCalc.Health Arena.Temp -= #bossDamageCalc.Amount Arena.Temp
    execute store result entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.Arena.boss.EntityData.Health int 0.01 run scoreboard players get #bossDamageCalc.Health Arena.Temp

        # 討伐判定
        execute if score #bossDamageCalc.Health Arena.Temp matches ..0 as @e[tag=arena.boss.Stage-Core,sort=nearest,limit=1] at @s run function arena_boss:type_specific/general/killed with entity @s data.Arena.boss.StageData

    # ボスバー処理
    data modify storage arena_boss:temp bossbarData.Health set from entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.Arena.boss.EntityData.Health
    data modify storage arena_boss:temp bossbarData.HealthMax set from entity @e[tag=arena.boss.Stage-Core,sort=nearest,limit=1] data.Arena.boss.StageData.EntityData.Health

    data modify storage arena_boss:temp bossbarData.Name set from entity @e[tag=arena.boss.Stage-Core,sort=nearest,limit=1] data.Arena.boss.StageData.DisplayData.Name
    data modify storage arena_boss:temp bossbarData.Directory set from entity @e[tag=arena.boss.Stage-Core,sort=nearest,limit=1] data.Arena.boss.StageData.Directory

    function arena_boss:misc/bossbar_modify with storage arena_boss:temp bossbarData

    # 一時タグ除去
    tag @s remove Arena.Temp-AttackerPlayer

