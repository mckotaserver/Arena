## Tick処理
#> アニメーション
    # 処理
    $execute as @e[tag=Arena.Boss.Main.Core,distance=..64] at @s run function arena_boss:type_specific/blaze_king/animation/$(Animation)

    # タイマー加算
    scoreboard players add @p[tag=Arena.Boss.Core-Player,sort=nearest,limit=1] ArenaBoss.Timer 1

#> 逃避スキル
# プレイヤーが近くにいる → タイマー加算
execute as @e[tag=Arena.Boss.Main.Core,distance=..64] at @s if entity @p[tag=Arena.Boss.Player,distance=..4] run scoreboard players add @s Arena.Temp 1

#> 移動
    # 位置同期
    execute as @e[tag=Arena.Boss.Main.Element,distance=..64] positioned as @e[tag=Arena.Boss.Main.Extra-01,sort=nearest,limit=1] run tp @s ~ ~ ~

    # 頭
    

    # TP
    execute as @e[tag=Arena.Boss.Main.Extra-01,distance=..64] at @s if entity @p[tag=Arena.Boss.Player,distance=4..16] rotated ~ 0 run tp @s ^ ^ ^0.1 facing entity @p[tag=Arena.Boss.Player]

