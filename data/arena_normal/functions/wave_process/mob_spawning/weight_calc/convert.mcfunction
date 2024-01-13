## Weightの割合を計算 → 生成乱数が範囲内なら召喚処理
# Checking番目のmob_dataから値を取得
$execute store result score #Spawning.WeightChecking Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].weight 100

# 有効な項目であるか: Conditionに沿っているか判定
data modify storage arena:temp SpawningData.WeightCalc.Ignore set value true

    # Wave
    $execute store result score #Spawning.Checking.Wave-Min Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Wave.Min
    $execute store result score #Spawning.Checking.Wave-Max Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Wave.Max

    $execute unless data storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Wave.Min run scoreboard players set #Spawning.Checking.Wave-Min Arena.Temp 0
    $execute unless data storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Wave.Max run scoreboard players set #Spawning.Checking.Wave-Max Arena.Temp 2048

    # Difficulty
    $execute store result score #Spawning.Checking.Difficulty-Min Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Difficulty.Min
    $execute store result score #Spawning.Checking.Difficulty-Max Arena.Temp run data get storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Difficulty.Max

    $execute unless data storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Difficulty.Min run scoreboard players set #Spawning.Checking.Difficulty-Min Arena.Temp 0
    $execute unless data storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)].Condition.Difficulty.Max run scoreboard players set #Spawning.Checking.Difficulty-Max Arena.Temp 2048

    execute if score #Spawning.Checking.Difficulty-Min Arena.Temp <= #Spawning.Difficulty Arena.Temp if score #Spawning.Difficulty Arena.Temp <= #Spawning.Checking.Difficulty-Max Arena.Temp if score #Spawning.Checking.Wave-Min Arena.Temp <= #Spawning.Wave Arena.Temp if score #Spawning.Wave Arena.Temp <= #Spawning.Checking.Wave-Max Arena.Temp run data modify storage arena:temp SpawningData.WeightCalc.Ignore set value false

# 割合計算, 累加
# tellraw @a [{"score":{"name": "#Spawning.WeightChecking","objective": "Arena.Temp"}},"/",{"score":{"name": "#Spawning.WeightSum","objective": "Arena.Temp"}}]

execute if data storage arena:temp {SpawningData:{WeightCalc:{Ignore:false}}} run scoreboard players operation #Spawning.WeightChecking Arena.Temp /= #Spawning.WeightSum Arena.Temp
# tellraw @a [{"score":{"name": "#Spawning.WeightChecking","objective": "Arena.Temp"}},"+",{"score":{"name": "#Spawning.WeightPre","objective": "Arena.Temp"}}]

execute if data storage arena:temp {SpawningData:{WeightCalc:{Ignore:false}}} run scoreboard players operation #Spawning.WeightChecking Arena.Temp += #Spawning.WeightPre Arena.Temp

# 1つ前データのWeight ≦ 生成乱数 ≦ 処理中データのWeight ⇒ 召喚
$execute if data storage arena:temp {SpawningData:{WeightCalc:{Ignore:false}}} if score #Spawning.WeightPre Arena.Temp <= #Spawning.Random Arena.Temp if score #Spawning.Random Arena.Temp <= #Spawning.WeightChecking Arena.Temp run data modify storage arena:temp SpawningData.SelectedMob set from storage arena:temp SpawningData.Detail-Original.mob_data[$(Checking)]
execute if data storage arena:temp {SpawningData:{WeightCalc:{Ignore:false}}} if score #Spawning.WeightPre Arena.Temp <= #Spawning.Random Arena.Temp if score #Spawning.Random Arena.Temp <= #Spawning.WeightChecking Arena.Temp run return 0

# tellraw @a [{"score":{"name": "#Spawning.WeightPre","objective": "Arena.Temp"}},"≦",{"score":{"name": "#Spawning.Random","objective": "Arena.Temp"}},"≦",{"score":{"name": "#Spawning.WeightChecking","objective": "Arena.Temp"}}]

# Checkingを +1
scoreboard players add #Spawning.Checking Arena.Temp 1
execute store result storage arena:temp SpawningData.WeightCalc.Checking int 1 run scoreboard players get #Spawning.Checking Arena.Temp

# 再起
execute if data storage arena:temp {SpawningData:{WeightCalc:{Ignore:false}}} run scoreboard players operation #Spawning.WeightPre Arena.Temp = #Spawning.WeightChecking Arena.Temp
execute if score #Spawning.Checking Arena.Temp >= #Spawning.CheckingLimit Arena.Temp run return 0
function arena_normal:wave_process/mob_spawning/weight_calc/convert with storage arena:temp SpawningData.WeightCalc
