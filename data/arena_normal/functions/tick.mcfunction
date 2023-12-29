## TICK.
# ステージから離れたプレイヤー
execute as @a[tag=Arena.Normal-Stage.Player] at @s unless entity @e[tag=Arena.Normal-Stage.Stage-Core,distance=..48] run function arena_normal:misc/player_reset
