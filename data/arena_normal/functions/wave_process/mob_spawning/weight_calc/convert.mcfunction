## Weightの割合を計算 → 生成乱数が範囲内なら召喚処理
# checking番目のmob_dataから値を取得
$execute store result score #spawning.weight_checking Arena.Temp run data get storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)].weight 100

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

    # tellraw awabi2048 ["DF: ",{"score":{"name": "#spawning.checking.difficulty_min","objective": "arena.Temp"}},"≦",{"score":{"name": "#spawning.difficulty","objective": "arena.Temp"}},"≦",{"score":{"name": "#spawning.checking.difficulty_max","objective": "arena.Temp"}}]
    # tellraw awabi2048 ["WV: ",{"score":{"name": "#spawning.checking.wave_min","objective": "arena.Temp"}},"≦",{"score":{"name": "#spawning.wave","objective": "arena.Temp"}},"≦",{"score":{"name": "#spawning.checking.wave_max","objective": "arena.Temp"}}]

    execute if score #spawning.checking.difficulty_min Arena.Temp <= #spawning.difficulty Arena.Temp if score #spawning.difficulty Arena.Temp <= #spawning.checking.difficulty_max Arena.Temp if score #spawning.checking.wave_min Arena.Temp <= #spawning.wave Arena.Temp if score #spawning.wave Arena.Temp <= #spawning.checking.wave_max Arena.Temp run data modify storage arena_normal:temp spawning_data.mob_select.weight_calc.ignore set value false
        # tellraw awabi2048 ["IF IGNORE: ",{"nbt":"spawning_data.mob_select.weight_calc.ignore","storage": "arena_normal:temp"}]

# 割合計算, 累加
execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} run scoreboard players operation #spawning.weight_checking Arena.Temp /= #spawning.weight_sum Arena.Temp
    # tellraw awabi2048 [{"score":{"name": "#spawning.weight_checking","objective": "arena.Temp"}},"+",{"score":{"name": "#spawning.weight_pre","objective": "arena.Temp"}},"="]

execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} run scoreboard players operation #spawning.weight_checking Arena.Temp += #spawning.weight_pre Arena.Temp
    # tellraw awabi2048 [{"score":{"name": "#spawning.weight_checking","objective": "arena.Temp"}}]

# 1つ前までデータのWeightの和 ≦ 生成乱数 ≦ 処理中データのWeight ⇒ 召喚
$execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} if score #spawning.weight_pre Arena.Temp <= #spawning.random Arena.Temp if score #spawning.random Arena.Temp <= #spawning.weight_checking Arena.Temp run data modify storage arena_normal:temp spawning_data.mob_select.out set from storage arena_normal:temp spawning_data.mob_select.in.mob_data[$(checking)]
    # $tellraw awabi2048 [{"score":{"name": "#spawning.weight_pre","objective": "arena.Temp"}},"≦",{"score":{"name": "#spawning.random","objective": "arena.Temp"}},"≦",{"score":{"name": "#spawning.weight_checking","objective": "arena.Temp"}}," Checking: [$(checking)]"]

execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} if score #spawning.weight_pre Arena.Temp <= #spawning.random Arena.Temp if score #spawning.random Arena.Temp <= #spawning.weight_checking Arena.Temp run return 0


# checkingを +1
scoreboard players add #spawning.checking Arena.Temp 1
execute store result storage arena_normal:temp spawning_data.weight_calc.checking int 1 run scoreboard players get #spawning.checking Arena.Temp

# 再起
execute if data storage arena_normal:temp {spawning_data:{mob_select:{weight_calc:{ignore:false}}}} run scoreboard players operation #spawning.weight_pre Arena.Temp = #spawning.weight_checking Arena.Temp
execute if score #spawning.checking Arena.Temp >= #spawning.checking_limit Arena.Temp run return 0
function arena_normal:wave_process/mob_spawning/weight_calc/convert with storage arena_normal:temp spawning_data.weight_calc
