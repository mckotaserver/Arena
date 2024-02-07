## CorePlayerの選出
# IDが最も大きいプレイヤーを取得
scoreboard players set #PlayerID.Max Arena.Temp -1
scoreboard players operation #PlayerID.Max Arena.Temp > @a[tag=Arena.Normal-Stage.Player,distance=..64] Arena.PlayerID

# IDが最も大きいプレイヤーにタグを付与
execute as @a[tag=Arena.Normal-Stage.Player,distance=..64] if score @s Arena.PlayerID = #PlayerID.Max Arena.Temp run tag @s add Arena.Normal-Stage.Core-Player
