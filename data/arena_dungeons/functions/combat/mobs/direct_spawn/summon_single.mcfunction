$function arena_dungeons:combat/mobs/direct_spawn/data_formatting {id:"$(id)",scale:$(scale)f}

execute store result storage arena_dungeons:temp mob_summon.distance float 0.1 run random value 10..30
execute store result storage arena_dungeons:temp mob_summon.rotation float 1 run random value 0..360

function arena_dungeons:combat/mobs/direct_spawn/summon with storage arena_dungeons:temp mob_summon
