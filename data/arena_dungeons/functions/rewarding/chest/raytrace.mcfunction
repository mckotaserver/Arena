execute as @e[tag=arena.dungeons.misc.treasure_chest_interaction,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] at @s as @e[tag=arena.dungeons.misc.treasure_chest_marker,sort=nearest,limit=1] run tag @s add arena.temp.dungeon_chest_clicked

execute as @e[tag=arena.dungeons.misc.treasure_chest_interaction,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] run return 0

execute positioned ^ ^ ^0.5 run function arena_dungeons:rewarding/chest/raytrace
execute unless entity @s[distance=..5] run return 0
