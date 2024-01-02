## クラフトアニメーション tick
# アイテム
execute as @e[tag=Arena.Utility.Altar.PlacedItemMount,distance=..3] at @s run tp @s ^ ^ ^0.04 facing entity @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1]

# パーティクル
execute at @e[tag=Arena.Utility.Altar.PlacedItemMount,distance=..3] run particle witch ~ ~0.2 ~ 0 0 0 0 1
execute at @e[tag=Arena.Utility.Altar.PlacedItemMount,distance=..3] run particle white_ash ~ ~0.25 ~ 0 0 0 0 1
execute at @e[tag=Arena.Utility.Altar.PlacedItemMount,distance=..3] run particle dust 1 100000000 100000000 1 ~ ~0.25 ~ 0 0 0 0 1
