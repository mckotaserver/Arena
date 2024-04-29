data modify storage arena_dungeons:temp mob_spawning.spawner.specify.id set from storage arena_dungeons:temp mob_spawning.spawner.specify.id_list[0]
function arena_dungeons:combat/mobs/direct_spawn/summon_single with storage arena_dungeons:temp mob_spawning.spawner.specify

data remove storage arena_dungeons:temp mob_spawning.spawner.specify.id_list[0]

execute if data storage arena_dungeons:temp mob_spawning.spawner.specify.id_list[0] run function arena_dungeons:combat/mobs/spawner/macro_assign

