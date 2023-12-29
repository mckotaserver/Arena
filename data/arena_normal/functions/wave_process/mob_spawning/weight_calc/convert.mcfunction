## Weightの割合を計算 → 生成乱数が範囲内なら召喚処理
# Checking番目のmob_dataから値を取得
$execute store result score #Spawning.WeightChecking Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].weight 100

# 割合計算, 累加
scoreboard players operation #Spawning.WeightChecking Arena.Temp /= #Spawning.WeightSum Arena.Temp
scoreboard players operation #Spawning.WeightChecking Arena.Temp += #Spawning.WeightPre Arena.Temp

# 1つ前データのWeight ≦ 生成乱数 ≦ 処理中データのWeight ⇒ 召喚
$execute if score #Spawning.WeightPre Arena.Temp <= #Spawning.Random Arena.Temp if score #Spawning.Random Arena.Temp <= #Spawning.WeightChecking Arena.Temp run data modify storage arena:temp SpawningData.SelectedMob set from storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)]
execute if score #Spawning.WeightPre Arena.Temp <= #Spawning.Random Arena.Temp if score #Spawning.Random Arena.Temp <= #Spawning.WeightChecking Arena.Temp run return -1

# Checkingを +1
scoreboard players add #Spawning.Checking Arena.Temp 1
execute store result storage arena:temp SpawningData.WeightCalc.Checking int 1 run scoreboard players get #Spawning.Checking Arena.Temp

# 再起
scoreboard players operation #Spawning.WeightPre Arena.Temp = #Spawning.WeightChecking Arena.Temp
execute if score #Spawning.Checking Arena.Temp >= #Spawning.CheckingLimit Arena.Temp run return -1
function arena_normal:wave_process/mob_spawning/weight_calc/convert with storage arena:temp SpawningData.WeightCalc
