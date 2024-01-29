kill @e[tag=Arena.Normal-Stage.Mob,distance=..64]

$scoreboard players set #Debug.Wave Arena.Temp $(Wave)
scoreboard players remove #Debug.Wave Arena.Temp 1

execute store result entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.StageData.wave int 1 run scoreboard players get #Debug.Wave Arena.Temp

execute as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] at @s run function arena_normal:wave_process/_

$tellraw @s [{"translate":"kota-server.arena.debug.message.prefix"}," ",{"translate":"kota-server.arena.debug.message.wave_skipped","with":[{"text":"$(Wave)","color": "yellow","bold": true}]}]

