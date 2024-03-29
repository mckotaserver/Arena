## Weightの割合を計算 → 生成乱数が範囲内なら召喚処理
# checking番目のmob_dataから値を取得
$execute store result score #spawning.weight_checking arena.temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].weight 100

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

    # tellraw awabi2048 ["DF: ",{"score":{"name": "#spawning.checking.difficulty_min","objective": "arena.temp"}},"≦",{"score":{"name": "#spawning.difficulty","objective": "arena.temp"}},"≦",{"score":{"name": "#spawning.checking.difficulty_max","objective": "arena.temp"}}]
    # tellraw awabi2048 ["WV: ",{"score":{"name": "#spawning.checking.wave_min","objective": "arena.temp"}},"≦",{"score":{"name": "#spawning.wave","objective": "arena.temp"}},"≦",{"score":{"name": "#spawning.checking.wave_max","objective": "arena.temp"}}]

    execute if score #spawning.checking.difficulty_min arena.temp <= #spawning.difficulty arena.temp if score #spawning.difficulty arena.temp <= #spawning.checking.difficulty_max arena.temp if score #spawning.checking.wave_min arena.temp <= #spawning.wave arena.temp if score #spawning.wave arena.temp <= #spawning.checking.wave_max arena.temp run data modify storage arena_normal:temp spawning_data.mob_select.weight_calc.ignore set value false
        # tellraw awabi2048 ["IF IGNORE: ",{"nbt":"spawning_data.mob_select.weight_calc.ignore","storage": "arena_normal:temp"}]

# 割合計算, 累加
execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} run scoreboard players operation #spawning.weight_checking arena.temp /= #spawning.weight_sum arena.temp
    # tellraw awabi2048 [{"score":{"name": "#spawning.weight_checking","objective": "arena.temp"}},"+",{"score":{"name": "#spawning.weight_pre","objective": "arena.temp"}},"="]

execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} run scoreboard players operation #spawning.weight_checking arena.temp += #spawning.weight_pre arena.temp
    # tellraw awabi2048 [{"score":{"name": "#spawning.weight_checking","objective": "arena.temp"}}]

# 1つ前までデータのWeightの和 ≦ 生成乱数 ≦ 処理中データのWeight ⇒ 召喚
$execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} if score #spawning.weight_pre arena.temp <= #spawning.random arena.temp if score #spawning.random arena.temp <= #spawning.weight_checking arena.temp run data modify storage arena_normal:temp spawning_data.mob_select.out set from storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)]
    # $tellraw awabi2048 [{"score":{"name": "#spawning.weight_pre","objective": "arena.temp"}},"≦",{"score":{"name": "#spawning.random","objective": "arena.temp"}},"≦",{"score":{"name": "#spawning.weight_checking","objective": "arena.temp"}}," Checking: [$(checking)]"]

execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} if score #spawning.weight_pre arena.temp <= #spawning.random arena.temp if score #spawning.random arena.temp <= #spawning.weight_checking arena.temp run return 0


# checkingを +1
scoreboard players add #spawning.checking arena.temp 1
execute store result storage arena_normal:temp spawning_data.weight_calc.checking int 1 run scoreboard players get #spawning.checking arena.temp

# 再起
execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} run scoreboard players operation #spawning.weight_pre arena.temp = #spawning.weight_checking arena.temp
execute if score #spawning.checking arena.temp >= #spawning.checking_limit arena.temp run return 0
function arena_normal:wave_process/mob_spawning/weight_calc/convert with storage arena_normal:temp spawning_data.weight_calc
