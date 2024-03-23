## CorePlayerの選出
# IDが最も大きいプレイヤーを取得
scoreboard players set #PlayerID.Max Arena.Temp -1
scoreboard players operation #PlayerID.Max Arena.Temp > @a[tag=arena.normal-stage.Player,distance=..64] Arena.PlayerID

# IDが最も大きいプレイヤーにタグを付与
execute as @a[tag=arena.normal-stage.Player,distance=..64] if score @s Arena.PlayerID = #PlayerID.Max Arena.Temp run tag @s add Arena.normal-stage.Core-Player
