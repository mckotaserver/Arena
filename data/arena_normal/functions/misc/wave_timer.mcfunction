## タイマー処理
#> 終了時刻に達したコアを実行
# 各終了予定時刻を取得
execute as @e[tag=arena.normal_stage.stage_core] store result score @s arena.temp run data get entity @s data.arena.timer.Endtick

# 現在時刻を取得
execute store result score #current_tick arena.temp at @e[tag=arena.normal_stage.stage_core,sort=random,limit=1] run time query gametime 

# 終了予定時刻と現在時刻が等しければ処理実行 → 
    # このとき遅延により正しく判定されない場合があるので、±10tick幅を広げておく
    scoreboard players operation #current_tick arena.temp /= #20 Constant
    scoreboard players operation #current_tick arena.temp *= #20 Constant

    scoreboard players operation #current_tick-Max arena.temp = #current_tick arena.temp
    scoreboard players add #current_tick-Max arena.temp 19

execute as @e[tag=arena.normal_stage.stage_core] if score #current_tick arena.temp <= @s arena.temp if score @s arena.temp <= #current_tick-Max arena.temp at @s run function arena_normal:wave_process/_

# カウントダウン用: 終了予定時刻 -20, -40, -60, -100, 200 tのとき表示
scoreboard players remove @e[tag=arena.normal_stage.stage_core] arena.temp 20
execute as @e[tag=arena.normal_stage.stage_core] if score #current_tick arena.temp <= @s arena.temp if score @s arena.temp <= #current_tick-Max arena.temp at @s run function arena_normal:wave_process/count_down {Countdown:1}

scoreboard players remove @e[tag=arena.normal_stage.stage_core] arena.temp 20
execute as @e[tag=arena.normal_stage.stage_core] if score #current_tick arena.temp <= @s arena.temp if score @s arena.temp <= #current_tick-Max arena.temp at @s run function arena_normal:wave_process/count_down {Countdown:2}

scoreboard players remove @e[tag=arena.normal_stage.stage_core] arena.temp 20
execute as @e[tag=arena.normal_stage.stage_core] if score #current_tick arena.temp <= @s arena.temp if score @s arena.temp <= #current_tick-Max arena.temp at @s run function arena_normal:wave_process/count_down {Countdown:3}

scoreboard players remove @e[tag=arena.normal_stage.stage_core] arena.temp 20
execute as @e[tag=arena.normal_stage.stage_core] if score #current_tick arena.temp <= @s arena.temp if score @s arena.temp <= #current_tick-Max arena.temp at @s run function arena_normal:wave_process/count_down {Countdown:4}

scoreboard players remove @e[tag=arena.normal_stage.stage_core] arena.temp 20
execute as @e[tag=arena.normal_stage.stage_core] if score #current_tick arena.temp <= @s arena.temp if score @s arena.temp <= #current_tick-Max arena.temp at @s run function arena_normal:wave_process/count_down {Countdown:5}

scoreboard players remove @e[tag=arena.normal_stage.stage_core] arena.temp 100
execute as @e[tag=arena.normal_stage.stage_core] if score #current_tick arena.temp <= @s arena.temp if score @s arena.temp <= #current_tick-Max arena.temp at @s run function arena_normal:wave_process/count_down {Countdown:10}

# スコアのリセット
execute as @e[tag=arena.normal_stage.stage_core] run scoreboard players reset @s arena.temp

# 20t後に再起schedule
execute as @e[tag=arena.normal_stage.stage_core] if data entity @s {data:{arena:{timer:{WaveWaiting:true}}}} run schedule function arena_normal:misc/wave_timer 20t

