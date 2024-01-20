## プレイヤー ボスへ攻撃時
# トリガー解除
advancement revoke @s only arena_boss:combat/player_hurt_boss

# 一時タグ追加
tag @s add Arena.Temp-AttackerPlayer

#> 被ダメージの取得・計算
    # Hitboxモブの体力を取得
    execute store result score #BossDamageCalc.DamageTaken Arena.Temp run data get entity @e[tag=Arena.Boss.Main.Hitbox,sort=nearest,limit=1] Health 100

    # 最大値からどれだけ減っているか計算
    scoreboard players remove #BossDamageCalc.DamageTaken Arena.Temp 102400
    scoreboard players operation #BossDamageCalc.DamageTaken Arena.Temp *= #-1 Constant

    # 防御力値を取得
    execute store result score #BossDamageCalc.Defense-Raw Arena.Temp run data get entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.EntityData.Defense
    scoreboard players operation #BossDamageCalc.Defense-Division Arena.Temp = #BossDamageCalc.Defense-Raw Arena.Temp

    # 除法計算
    scoreboard players add #BossDamageCalc.Defense-Division Arena.Temp 100

    # ダメージ軽減率を乗算
    scoreboard players operation #BossDamageCalc.DamageTaken Arena.Temp *= #100 Constant
    scoreboard players operation #BossDamageCalc.DamageTaken Arena.Temp /= #BossDamageCalc.Defense-Division Arena.Temp

    # ストレージへ移動
    execute store result storage arena_boss:temp OnAttacked.DamageAmount float 0.01 run scoreboard players get #BossDamageCalc.DamageTaken Arena.Temp

#> おのおのの処理へ分岐
    # 分岐先 ディレクトリ/ファイル名 の設定
    data modify storage arena_boss:temp MacroAssignment.Directory set from entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.StageData.Directory

    data modify storage arena_boss:temp MacroAssignment.Function set value "on_attacked"

    # 実行
    execute as @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] at @s run function arena_boss:type_specific/general/macro_assignment with storage arena_boss:temp MacroAssignment

#> 後処理
    # Hitboxモブの体力調整
    data modify entity @e[tag=Arena.Boss.Main.Hitbox,sort=nearest,limit=1] Health set value 1024f

    # 計算後ダメージを保存
    execute store result score #BossDamageCalc.Amount Arena.Temp run data get storage arena_boss:temp OnAttacked.DamageAmount 100
    execute store result score #BossDamageCalc.Health Arena.Temp run data get entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.EntityData.Health 100

    scoreboard players operation #BossDamageCalc.Health Arena.Temp -= #BossDamageCalc.Amount Arena.Temp
    execute store result entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.EntityData.Health float 0.01 run scoreboard players get #BossDamageCalc.Health Arena.Temp

        # 討伐判定
        execute if score #BossDamageCalc.Health Arena.Temp matches ..0 run function arena_boss:type_specific/general/killed

    # 一時タグ除去
    tag @s remove Arena.Temp-AttackerPlayer

