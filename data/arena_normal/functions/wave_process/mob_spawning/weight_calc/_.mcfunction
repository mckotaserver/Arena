## weightから乱数変換
# ステージ詳細データをコピー
data modify storage arena_normal:temp spawning_data.mob_select.in set from entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.stage_detail

#> Weightの和を計算
    # 反復管理スコア / 集計スコア のリセット
    scoreboard players set #spawning.checking arena.temp 0
    scoreboard players set #spawning.weight_sum arena.temp 0

    # 確認数チェックの変数
    execute store result storage arena_normal:temp spawning_data.mob_select.weight_calc.checking int 1 run scoreboard players get #spawning.checking arena.temp

    execute store result score #spawning.checking_limit arena.temp run data get entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.stage_detail.mob_data

    # 比較のための難易度・ウェーブを取得
    execute store result score #spawning.wave arena.temp run data get entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.stage_data.wave
    execute store result score #spawning.difficulty arena.temp run data get entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.stage_data.difficulty

    function arena_normal:wave_process/mob_spawning/weight_calc/sum with storage arena_normal:temp spawning_data.mob_select.weight_calc
        # tellraw awabi2048 ["SUM:",{"score":{"name": "#spawning.weight_sum","objective": "arena.temp"}}]
    

# 全体の割合から召喚mobを決定
scoreboard players set #spawning.checking arena.temp 0
scoreboard players set #spawning.weight_checking arena.temp 0
scoreboard players set #spawning.weight_pre arena.temp 0

data modify storage arena_normal:temp spawning_data.mob_select.weight_calc.checking set value 0
function arena_normal:wave_process/mob_spawning/weight_calc/convert with storage arena_normal:temp spawning_data.mob_select.weight_calc
