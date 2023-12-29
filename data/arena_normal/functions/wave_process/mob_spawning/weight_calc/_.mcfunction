## weightから乱数変換
# weightの和を計算
scoreboard players set #Spawning.Checking Arena.Temp 0
scoreboard players set #Spawning.WeightSum Arena.Temp 0

execute store result storage arena:temp SpawningData.WeightCalc.Checking int 1 run scoreboard players get #Spawning.Checking Arena.Temp
execute store result score #Spawning.CheckingLimit Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data

function arena_normal:wave_process/mob_spawning/weight_calc/sum with storage arena:temp SpawningData.WeightCalc

# 全体の割合から召喚mobを決定
scoreboard players set #Spawning.Checking Arena.Temp 0
scoreboard players set #Spawning.WeightChecking Arena.Temp 0
scoreboard players set #Spawning.WeightPre Arena.Temp 0

data modify storage arena:temp SpawningData.WeightCalc.Checking set value 0
function arena_normal:wave_process/mob_spawning/weight_calc/convert with storage arena:temp SpawningData.WeightCalc
