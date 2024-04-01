## モブ召喚処理
# 重複防止
execute at @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] run tag @e[tag=arena.normal_stage.spawn_marker,distance=..48] remove arena.temp.recent_spawned
tag @s add arena.temp.recent_spawned

#> 乱数から召喚
# 乱数生成
execute store result score #spawning.random arena.temp run random value 0..99

# Weight から召喚情報を設定
data modify storage arena_normal:temp spawning_data.mob_select.out set value {}
function arena_normal:wave_process/mob_spawning/weight_calc/_

    # tellraw awabi2048 ["spawning: ",{"nbt":"spawning_data.mob_select.out","storage":"arena_normal:temp"}]

# 召喚
function arena_normal:wave_process/mob_spawning/main with entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.stage_data

# 再起可能性
execute as @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] store result entity @s data.arena.spawning.counter int 0.9999 run data get entity @s data.arena.spawning.counter

execute if data entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] {data:{arena:{spawning:{counter:0}}}} run data modify entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.status set value "in_wave"
execute if data entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] {data:{arena:{spawning:{counter:0}}}} run return 0

# 20tick後に再起
scoreboard players set @p[tag=arena.normal_stage.core_player] arena.timer 20
data modify entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.scheduler.command set value "execute as @e[tag=arena.normal_stage.spawn_marker,sort=random,limit=1,distance=..48,tag=!arena.temp.arena.temp.recent_spawned] at @s run function arena_normal:wave_process/mob_spawning/_"

    # tellraw awabi2048 {"text": "","color": "aqua","extra":[{"text":"[DEBUG]","color": "dark_purple"},{"text": "SCHEDULING:"},{"nbt":"data.arena.scheduler.command","entity": "@e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1]"}]}
    # tellraw awabi2048 {"text": "- ","color": "red","extra":[{"text":"[DEBUG]","color": "dark_purple"},{"text": "timer:"},{"score":{"name": "@p[tag=arena.normal_stage.core_stage]","objective": "arena.timer"}}]}

