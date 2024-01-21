scoreboard players operation #Random.Max Arena.Temp < @a[tag=Arena.Boss.Player,distance=..64] ArenaBoss.PlayerID

execute as @a[tag=Arena.Boss.Player,distance=..64] if score @s ArenaBoss.PlayerID = #Random.Max Arena.Temp run tag @s add Arena.Boss.Core-Player
execute as @a[tag=Arena.Boss.Player,distance=..64] if score @s ArenaBoss.PlayerID = #Random.Max Arena.Temp run scoreboard players reset @s ArenaBoss.PlayerID
