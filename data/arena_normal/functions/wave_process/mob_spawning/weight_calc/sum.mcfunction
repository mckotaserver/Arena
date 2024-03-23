## Weightの和を計算
# checking番目のmob_dataから値を取得
$execute store result score #spawning.weight_checking Arena.Temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].weight

# 有効な項目であるか: conditionに沿っているか判定
data modify storage arena_normal:temp spawning_data.mob_select.weight_calc.ignore set value true

    # wave
    $execute store result score #spawning.checking.wave_min Arena.Temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.wave.min
    $execute store result score #spawning.checking.wave_max Arena.Temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.wave.max

    $execute unless data storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.wave.min run scoreboard players set #spawning.checking.wave_min Arena.Temp 0
    $execute unless data storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.wave.max run scoreboard players set #spawning.checking.wave_max Arena.Temp 2048

    # difficulty
    $execute store result score #spawning.checking.difficulty_min Arena.Temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.difficulty.min
    $execute store result score #spawning.checking.difficulty_max Arena.Temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.difficulty.max

    $execute unless data storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.difficulty.min run scoreboard players set #spawning.checking.difficulty_min Arena.Temp 0
    $execute unless data storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.difficulty.max run scoreboard players set #spawning.checking.difficulty_max Arena.Temp 2048

    execute if score #spawning.checking.difficulty_min Arena.Temp <= #spawning.difficulty Arena.Temp if score #spawning.difficulty Arena.Temp <= #spawning.checking.difficulty_max Arena.Temp if score #spawning.checking.wave_min Arena.Temp <= #spawning.wave Arena.Temp if score #spawning.wave Arena.Temp <= #spawning.checking.wave_max Arena.Temp run data modify storage arena_normal:temp spawning_data.mob_select.weight_calc.ignore set value false

# 加算
    # tellraw awabi2048 ["sum calc:",{"score":{"name": "#spawning.weight_sum","objective": "arena.Temp"}},"+=",{"score":{"name": "#spawning.weight_checking","objective": "arena.Temp"}}]
execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} run scoreboard players operation #spawning.weight_sum Arena.Temp += #spawning.weight_checking Arena.Temp

# checkingを+1
scoreboard players add #spawning.checking Arena.Temp 1
execute store result storage arena_normal:temp spawning_data.mob_select.weight_calc.checking int 1 run scoreboard players get #spawning.checking Arena.Temp

# 再起
execute if score #spawning.checking Arena.Temp >= #spawning.checking_limit Arena.Temp run return 0
function arena_normal:wave_process/mob_spawning/weight_calc/sum with storage arena_normal:temp spawning_data.mob_select.weight_calc
