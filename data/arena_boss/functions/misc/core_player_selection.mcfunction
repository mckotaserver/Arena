scoreboard players operation #Random.Max Arena.Temp < @a[tag=arena.boss.Player,distance=..64] Arena.PlayerID

execute as @a[tag=arena.boss.Player,distance=..64] if score @s Arena.PlayerID = #Random.Max Arena.Temp run tag @s add Arena.boss.Core-Player
execute as @a[tag=arena.boss.Player,distance=..64] if score @s Arena.PlayerID = #Random.Max Arena.Temp run scoreboard players reset @s Arena.PlayerID
