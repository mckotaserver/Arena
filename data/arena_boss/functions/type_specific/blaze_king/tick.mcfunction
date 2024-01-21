## Tick処理
#> 逃避スキル
# プレイヤーが近くにいる → タイマー加算
execute as @e[tag=Arena.Boss.Main.Core,distance=..64] at @s if entity @p[tag=Arena.Boss.Player,distance=..4] run scoreboard players add @s Arena.Temp 1

#> 移動
    # 頭
    execute as @e[tag=Arena.Boss.Main.Element-08,distance=..64] at @s facing entity @p[tag=Arena.Boss.Player] feet rotated ~ 0 run tp @s ~ ~ ~ ~ ~
    execute as @e[tag=Arena.Boss.Main.Element-07,distance=..64] at @s facing entity @p[tag=Arena.Boss.Player] feet rotated ~ 0 run tp @s ~ ~ ~ ~ ~

    # TP
    execute unless data entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] {data:{Arena:{Boss:{OperationData:{Flags:{NoMove:true}}}}}} as @e[tag=Arena.Boss.Main.Extra-01,sort=nearest,limit=1,distance=..64] at @s if entity @p[tag=Arena.Boss.Player,distance=4..] facing entity @p[tag=Arena.Boss.Player] feet rotated ~ 0 run tp @s ^ ^ ^0.15

    # 位置同期
    execute as @e[tag=Arena.Boss.Main.Element,distance=..64] positioned as @e[tag=Arena.Boss.Main.Extra-01,sort=nearest,limit=1] run tp @s ~ ~ ~

#> アニメーション
    # 処理
    $execute as @e[tag=Arena.Boss.Main.Core,distance=..64] at @s run function arena_boss:type_specific/blaze_king/animation/$(Animation)

    # タイマー加算
    scoreboard players add @p[tag=Arena.Boss.Core-Player,sort=nearest,limit=1] ArenaBoss.Timer 1

#> 飛翔体
    execute as @e[tag=Arena.Boss.Main.Extra-07,distance=..64] at @s run function arena_boss:type_specific/blaze_king/animation/shot/tick
    execute as @e[tag=Arena.Boss.Main.Extra-08,distance=..32] at @s unless entity @p[tag=Arena.Boss.Player,distance=..64] run kill @s
