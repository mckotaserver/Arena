## Weightの和を計算
# Checking番目のmob_dataから値を取得
$execute store result score #Spawning.WeightChecking Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].weight

# 加算
scoreboard players operation #Spawning.WeightSum Arena.Temp += #Spawning.WeightChecking Arena.Temp

# Checkingを+1
scoreboard players add #Spawning.Checking Arena.Temp 1
execute store result storage arena:temp SpawningData.WeightCalc.Checking int 1 run scoreboard players get #Spawning.Checking Arena.Temp

# 再起
execute if score #Spawning.Checking Arena.Temp >= #Spawning.CheckingLimit Arena.Temp run return -1
function arena_normal:wave_process/mob_spawning/weight_calc/sum with storage arena:temp SpawningData.WeightCalc
