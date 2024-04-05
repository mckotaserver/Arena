## 遅延処理用
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

# 終了予定時刻と現在時刻が等しければ処理実行
execute as @e[tag=arena.normal_stage.stage_core] if score #current_tick arena.temp <= @s arena.temp if score @s arena.temp <= #current_tick-Max arena.temp at @s as @e[tag=arena.normal_stage.spawn_marker,sort=random,limit=1,distance=..32,tag=!arena.temp.recent_spawned] at @s run function arena_normal:wave_process/mob_spawning/_
execute as @e[tag=arena.normal_stage.stage_core] if score #current_tick arena.temp <= @s arena.temp if score @s arena.temp <= #current_tick-Max arena.temp at @s as @e[tag=arena.temp.recent_spawned,distance=..32] run tag @s remove arena.temp.recent_spawned


