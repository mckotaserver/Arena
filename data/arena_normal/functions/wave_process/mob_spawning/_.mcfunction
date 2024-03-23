## モブ召喚処理
# プレイヤーいなければ中止
execute unless entity @p[tag=arena.normal-stage.Player,distance=..48] run function arena_normal:misc/stage_reset
execute unless entity @p[tag=arena.normal-stage.Player,distance=..48] run return 0

# 重複防止
execute at @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] run tag @e[tag=arena.normal-stage.SpawnMarker,distance=..48] remove Arena.Temp-RecentSpawnedPos
tag @s add Arena.Temp-RecentSpawnedPos

#> 乱数から召喚
# 乱数生成
execute store result score #spawning.random Arena.Temp run random value 0..99

# Weight から召喚情報を設定
data modify storage arena_normal:temp spawning_data.mob_select.out set value {}
function arena_normal:wave_process/mob_spawning/weight_calc/_

    # tellraw awabi2048 ["Spawning: ",{"nbt":"spawning_data.mob_select.out","storage":"arena_normal:temp"}]

# 召喚
function arena_normal:wave_process/mob_spawning/main with entity @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] data.Arena.stage_data

# 再起可能性
execute as @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] store result entity @s data.Arena.Spawning.counter int 0.9999 run data get entity @s data.Arena.Spawning.counter

execute if data entity @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] {data:{Arena:{Spawning:{counter:0}}}} run data modify entity @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] data.status set value "in_wave"
execute if data entity @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] {data:{Arena:{Spawning:{counter:0}}}} run return 0

# 20tick後に再起
scoreboard players set @p[tag=arena.normal-stage.Core-Player] Arena.Timer 20
data modify entity @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] data.status set value "mob_spawning"


