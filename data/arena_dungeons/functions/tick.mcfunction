## Tick
# クリック検知
execute as @a[tag=arena.dungeons.player] at @s run function arena_dungeons:combat/player/click_detection/tick

execute as @a[tag=arena.dungeons.player] at @s as @e[tag=arena.dungeons.misc.projectile_marker,distance=..16] if score @s arena = @p arena.player_id at @s run function arena_dungeons:item/projectile/tick with entity @s data.arena.dungeons.projectile_data

# treasure_chest
# execute at @a[tag=arena.dungeons.player] if entity @e[tag=arena.dungeons.misc.treasure_chest_marker,tag=!arena.temp.dungeon_chest_popping,distance=..2] as @e[tag=arena.dungeons.animated_java.treasure_chest,sort=nearest,limit=1] run function animated_java:treasure_chest/animations/pop/play 

# execute at @a[tag=arena.dungeons.player] as @e[tag=arena.dungeons.misc.treasure_chest_marker,tag=!arena.temp.dungeon_chest_popping,distance=..2] run tag @s add arena.temp.dungeon_chest_popping

# execute at @a[tag=arena.dungeons.player] as @e[tag=arena.dungeons.misc.treasure_chest_marker,distance=..6] at @s unless entity @a[tag=arena.dungeons.player,distance=..2] as @e[tag=arena.dungeons.animated_java.treasure_chest,sort=nearest,limit=1] run function animated_java:treasure_chest/animations/pop/stop

# execute at @a[tag=arena.dungeons.player] as @e[tag=arena.dungeons.misc.treasure_chest_marker,tag=arena.temp.dungeon_chest_popping,distance=..6] at @s unless entity @a[tag=arena.dungeons.player,distance=..2] run tag @s remove arena.temp.dungeon_chest_popping

# spawner
execute at @a[tag=arena.dungeons.player,tag=!arena.flags.debug] as @e[tag=arena.dungeons.mobs.spawner.core,distance=..5] at @s run function arena_dungeons:combat/mobs/spawner/on_work
execute at @a[tag=arena.dungeons.player,tag=!arena.flags.debug] as @e[tag=arena.dungeons.misc.treasure_chest_spawner,distance=..4] at @s run function arena_dungeons:rewarding/chest/spawn with entity @s data.arena.dungeons

