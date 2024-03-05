## weightから乱数変換
# ステージ詳細データをコピー
data modify storage arena_normal:temp spawning_data.mob_select.in set from entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.stage_detail

#> Weightの和を計算
    # 反復管理スコア / 集計スコア のリセット
    scoreboard players set #spawning.checking Arena.Temp 0
    scoreboard players set #spawning.weight_sum Arena.Temp 0

    # 確認数チェックの変数
    execute store result storage arena_normal:temp spawning_data.mob_select.weight_calc.checking int 1 run scoreboard players get #spawning.checking Arena.Temp

    execute store result score #spawning.checking_limit Arena.Temp run data get entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.stage_detail.mob_data

    # 比較のための難易度・ウェーブを取得
    execute store result score #spawning.wave Arena.Temp run data get entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.stage_data.wave
    execute store result score #spawning.difficulty Arena.Temp run data get entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.stage_data.difficulty

    function arena_normal:wave_process/mob_spawning/weight_calc/sum with storage arena_normal:temp spawning_data.mob_select.weight_calc
        # tellraw awabi2048 ["SUM:",{"score":{"name": "#spawning.weight_sum","objective": "Arena.Temp"}}]
    

# 全体の割合から召喚mobを決定
scoreboard players set #spawning.checking Arena.Temp 0
scoreboard players set #spawning.weight_checking Arena.Temp 0
scoreboard players set #spawning.weight_pre Arena.Temp 0

data modify storage arena_normal:temp spawning_data.mob_select.weight_calc.checking set value 0
function arena_normal:wave_process/mob_spawning/weight_calc/convert with storage arena_normal:temp spawning_data.mob_select.weight_calc
