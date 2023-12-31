## weightから乱数変換
# weightの和を計算
scoreboard players set #Spawning.Checking Arena.Temp 0
scoreboard players set #Spawning.WeightSum Arena.Temp 0

execute store result storage arena:temp SpawningData.WeightCalc.Checking int 1 run scoreboard players get #Spawning.Checking Arena.Temp

execute store result score #Spawning.CheckingLimit Arena.Temp run data get entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.Spawning.Detail.mob_data

execute store result score #Spawning.Wave Arena.Temp run data get entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.Wave
execute store result score #Spawning.Difficulty Arena.Temp run data get entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.StageData.Difficulty

function arena_normal:wave_process/mob_spawning/weight_calc/sum with storage arena:temp SpawningData.WeightCalc

# 全体の割合から召喚mobを決定
scoreboard players set #Spawning.Checking Arena.Temp 0
scoreboard players set #Spawning.WeightChecking Arena.Temp 0
scoreboard players set #Spawning.WeightPre Arena.Temp 0

data modify storage arena:temp SpawningData.WeightCalc.Checking set value 0
function arena_normal:wave_process/mob_spawning/weight_calc/convert with storage arena:temp SpawningData.WeightCalc
