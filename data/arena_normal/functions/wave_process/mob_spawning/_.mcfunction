## モブ召喚処理
# プレイヤーいなければ中止
execute unless entity @p[tag=Arena.Normal-Stage.Player,distance=..48] run function arena_normal:misc/stage_reset
execute unless entity @p[tag=Arena.Normal-Stage.Player,distance=..48] run return 0

# 重複防止
tag @s add Arena.Temp-RecentSpawnedPos

#> 乱数から召喚
# 乱数生成
execute store result score #Spawning.Random Arena.Temp run random value 0..99

# Weight から召喚情報を設定
data modify storage arena:temp SpawningData.SelectedMob set value {}
function arena_normal:wave_process/mob_spawning/weight_calc/_

# tellraw awabi2048 ["Spawning: ",{"nbt":"SpawningData.SelectedMob.id","storage":"arena:temp"},", ",{"nbt":"SpawningData.SelectedMob.Multiplier","storage":"arena:temp"}]

# 召喚
data modify storage arena:temp SpawningData.SelectedMob.data merge value {Tags:["Arena.Normal-Stage.Mob"],Motion: [0.0d, 0.25d, 0.0d],Team:"Arena.Mobs"}
function arena_normal:wave_process/mob_spawning/main with storage arena:temp SpawningData.SelectedMob

# 再起可能性
execute as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] store result entity @s data.Arena.Spawning.Counter int 0.9999 run data get entity @s data.Arena.Spawning.Counter
execute if data entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] {data:{Arena:{Spawning:{Counter:0}}}} run return 0

# 20tick後に再起
execute store result score #EndTick Arena.Temp run time query gametime 
scoreboard players add #EndTick Arena.Temp 20

execute store result entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp
schedule function arena_normal:wave_process/mob_spawning/delay 20t


