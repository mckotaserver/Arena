scoreboard players operation #Random.Max arena.temp < @a[tag=arena.boss.player,distance=..64] arena.player_id

execute as @a[tag=arena.boss.player,distance=..64] if score @s arena.player_id = #Random.Max arena.temp run tag @s add arena.boss.core_player
execute as @a[tag=arena.boss.player,distance=..64] if score @s arena.player_id = #Random.Max arena.temp run scoreboard players reset @s arena.player_id
