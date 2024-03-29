## タイマー処理
#> 終了時刻に達したコアを実行
# 各終了予定時刻を取得
execute as @e[tag=arena.boss.stage_core] store result score @s arena.temp run data get entity @s data.arena.Timer.EndTick

# 現在時刻を取得
execute store result score #CurrentTick arena.temp at @e[tag=arena.boss.stage_core,sort=random,limit=1] run time query gametime 

# 終了予定時刻と現在時刻が等しければ処理実行 → 
    # このとき遅延により正しく判定されない場合があるので、±10tick幅を広げておく
    scoreboard players operation #CurrentTick arena.temp /= #20 Constant
    scoreboard players operation #CurrentTick arena.temp *= #20 Constant

    scoreboard players operation #CurrentTick-Max arena.temp = #CurrentTick arena.temp
    scoreboard players add #CurrentTick-Max arena.temp 19

execute as @e[tag=arena.boss.stage_core] if score #CurrentTick arena.temp <= @s arena.temp if score @s arena.temp <= #CurrentTick-Max arena.temp at @s run function arena_boss:type_specific/general/spawn with entity @s data.arena.boss.StageData

# カウントダウン用: 終了予定時刻 -20, -40, -60, -100, 200 tのとき表示
scoreboard players remove @e[tag=arena.boss.stage_core] arena.temp 20
execute as @e[tag=arena.boss.stage_core] if score #CurrentTick arena.temp <= @s arena.temp if score @s arena.temp <= #CurrentTick-Max arena.temp at @s run function arena_boss:misc/timer/countdown {Countdown:1}

scoreboard players remove @e[tag=arena.boss.stage_core] arena.temp 20
execute as @e[tag=arena.boss.stage_core] if score #CurrentTick arena.temp <= @s arena.temp if score @s arena.temp <= #CurrentTick-Max arena.temp at @s run function arena_boss:misc/timer/countdown {Countdown:2}

scoreboard players remove @e[tag=arena.boss.stage_core] arena.temp 20
execute as @e[tag=arena.boss.stage_core] if score #CurrentTick arena.temp <= @s arena.temp if score @s arena.temp <= #CurrentTick-Max arena.temp at @s run function arena_boss:misc/timer/countdown {Countdown:3}

scoreboard players remove @e[tag=arena.boss.stage_core] arena.temp 20
execute as @e[tag=arena.boss.stage_core] if score #CurrentTick arena.temp <= @s arena.temp if score @s arena.temp <= #CurrentTick-Max arena.temp at @s run function arena_boss:misc/timer/countdown {Countdown:4}

scoreboard players remove @e[tag=arena.boss.stage_core] arena.temp 20
execute as @e[tag=arena.boss.stage_core] if score #CurrentTick arena.temp <= @s arena.temp if score @s arena.temp <= #CurrentTick-Max arena.temp at @s run function arena_boss:misc/timer/countdown {Countdown:5}

scoreboard players remove @e[tag=arena.boss.stage_core] arena.temp 100
execute as @e[tag=arena.boss.stage_core] if score #CurrentTick arena.temp <= @s arena.temp if score @s arena.temp <= #CurrentTick-Max arena.temp at @s run function arena_boss:misc/timer/countdown {Countdown:10}

# スコアのリセット
execute as @e[tag=arena.boss.stage_core] run scoreboard players reset @s arena.temp

# 20t後に再起schedule
execute as @e[tag=arena.boss.stage_core] if data entity @s {data:{arena:{Timer:{WaveWaiting:true}}}} run schedule function arena_boss:misc/timer/scheduler 20t

