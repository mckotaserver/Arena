## Tick
#> プレイヤー
    # 代表プレイヤーの設定
    execute as @a[tag=Arena.Boss.Player,tag=!Arena.Boss.Core-Player] unless entity @a[tag=Arena.Boss.Core-Player,distance=..128] at @s run tag @r[tag=Arena.Boss.Player,distance=..128] add Arena.Boss.Core-Player
