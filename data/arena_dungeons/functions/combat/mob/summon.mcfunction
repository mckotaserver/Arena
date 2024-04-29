$summon $(entity_id) ~ ~512 ~ $(nbt)

summon marker ~ ~512 ~ {Tags:["arena.dungeons.mobs","arena.dungeons.mobs.marker"]}

execute positioned ~ ~512 ~ run ride @e[tag=arena.dungeons.mobs.marker,limit=1,distance=0] mount @e[tag=arena.dungeons.mobs.main,limit=1,distance=0]
execute positioned ~ ~512 ~ run tp @e[tag=arena.dungeons.mobs.main,limit=1,distance=0] ~ ~-512 ~

particle minecraft:instant_effect ~ ~0.5 ~ 0.1 0.1 0.1 1 4
