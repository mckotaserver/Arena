kill @e[tag=arena.normal_stage.mob,distance=..64]

$scoreboard players set #debug.wave arena.temp $(wave)
scoreboard players remove #debug.wave arena.temp 1

execute store result entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.StageData.wave int 1 run scoreboard players get #debug.wave arena.temp

execute as @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] at @s run function arena_normal:wave_process/_

$tellraw @s [{"translate":"kota-server.arena.debug.message.prefix"}," ",{"translate":"kota-server.arena.debug.message.wave_skipped","with":[{"text":"$(wave)","color": "yellow","bold": true}]}]

