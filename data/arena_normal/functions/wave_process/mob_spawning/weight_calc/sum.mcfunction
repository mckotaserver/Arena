## Weightの和を計算
# Checking番目のmob_dataから値を取得
$execute store result score #Spawning.WeightChecking Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].weight

# 有効な項目であるか: Conditionに沿っているか判定
data modify storage arena:temp SpawningData.WeightCalc.Ignore set value true

    # Wave
    $execute store result score #Spawning.Checking.Wave-Min Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Wave.Min
    $execute store result score #Spawning.Checking.Wave-Max Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Wave.Max

    # Difficulty
    $execute store result score #Spawning.Checking.Difficulty-Min Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Difficulty.Min
    $execute store result score #Spawning.Checking.Difficulty-Max Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Difficulty.Max

    execute if score #Spawning.Checking.Difficulty-Min Arena.Temp <= #Spawning.Difficulty Arena.Temp if score #Spawning.Difficulty Arena.Temp <= #Spawning.Checking.Difficulty-Max Arena.Temp if score #Spawning.Checking.Wave-Min Arena.Temp <= #Spawning.Wave Arena.Temp if score #Spawning.Wave Arena.Temp <= #Spawning.Checking.Wave-Max Arena.Temp run data modify storage arena:temp SpawningData.WeightCalc.Ignore set value false

# 加算
execute if data storage arena:temp {SpawningData:{WeightCalc:{Ignore:false}}} run scoreboard players operation #Spawning.WeightSum Arena.Temp += #Spawning.WeightChecking Arena.Temp

# Checkingを+1
scoreboard players add #Spawning.Checking Arena.Temp 1
execute store result storage arena:temp SpawningData.WeightCalc.Checking int 1 run scoreboard players get #Spawning.Checking Arena.Temp

# 再起
execute if score #Spawning.Checking Arena.Temp >= #Spawning.CheckingLimit Arena.Temp run return -1
function arena_normal:wave_process/mob_spawning/weight_calc/sum with storage arena:temp SpawningData.WeightCalc
