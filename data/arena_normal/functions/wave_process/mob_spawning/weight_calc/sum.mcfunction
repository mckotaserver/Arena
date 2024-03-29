## Weightの和を計算
# checking番目のmob_dataから値を取得
$execute store result score #spawning.weight_checking arena.temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].weight

# 有効な項目であるか: conditionに沿っているか判定
data modify storage arena_normal:temp spawning_data.mob_select.weight_calc.ignore set value true

    # wave
    $execute store result score #spawning.checking.wave_min arena.temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.wave.min
    $execute store result score #spawning.checking.wave_max arena.temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.wave.max

    $execute unless data storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.wave.min run scoreboard players set #spawning.checking.wave_min arena.temp 0
    $execute unless data storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.wave.max run scoreboard players set #spawning.checking.wave_max arena.temp 2048

    # difficulty
    $execute store result score #spawning.checking.difficulty_min arena.temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.difficulty.min
    $execute store result score #spawning.checking.difficulty_max arena.temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.difficulty.max

    $execute unless data storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.difficulty.min run scoreboard players set #spawning.checking.difficulty_min arena.temp 0
    $execute unless data storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].condition.difficulty.max run scoreboard players set #spawning.checking.difficulty_max arena.temp 2048

    execute if score #spawning.checking.difficulty_min arena.temp <= #spawning.difficulty arena.temp if score #spawning.difficulty arena.temp <= #spawning.checking.difficulty_max arena.temp if score #spawning.checking.wave_min arena.temp <= #spawning.wave arena.temp if score #spawning.wave arena.temp <= #spawning.checking.wave_max arena.temp run data modify storage arena_normal:temp spawning_data.mob_select.weight_calc.ignore set value false

# 加算
    # tellraw awabi2048 ["sum calc:",{"score":{"name": "#spawning.weight_sum","objective": "arena.temp"}},"+=",{"score":{"name": "#spawning.weight_checking","objective": "arena.temp"}}]
execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} run scoreboard players operation #spawning.weight_sum arena.temp += #spawning.weight_checking arena.temp

# checkingを+1
scoreboard players add #spawning.checking arena.temp 1
execute store result storage arena_normal:temp spawning_data.mob_select.weight_calc.checking int 1 run scoreboard players get #spawning.checking arena.temp

# 再起
execute if score #spawning.checking arena.temp >= #spawning.checking_limit arena.temp run return 0
function arena_normal:wave_process/mob_spawning/weight_calc/sum with storage arena_normal:temp spawning_data.mob_select.weight_calc
