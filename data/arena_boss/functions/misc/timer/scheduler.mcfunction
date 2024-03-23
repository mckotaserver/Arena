## タイマー処理
#> 終了時刻に達したコアを実行
# 各終了予定時刻を取得
execute as @e[tag=arena.boss.Stage-Core] store result score @s Arena.Temp run data get entity @s data.Arena.Timer.EndTick

# 現在時刻を取得
execute store result score #CurrentTick Arena.Temp at @e[tag=arena.boss.Stage-Core,sort=random,limit=1] run time query gametime 

# 終了予定時刻と現在時刻が等しければ処理実行 → 
    # このとき遅延により正しく判定されない場合があるので、±10tick幅を広げておく
    scoreboard players operation #CurrentTick Arena.Temp /= #20 Constant
    scoreboard players operation #CurrentTick Arena.Temp *= #20 Constant

    scoreboard players operation #CurrentTick-Max Arena.Temp = #CurrentTick Arena.Temp
    scoreboard players add #CurrentTick-Max Arena.Temp 19

execute as @e[tag=arena.boss.Stage-Core] if score #CurrentTick Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick-Max Arena.Temp at @s run function arena_boss:type_specific/general/spawn with entity @s data.Arena.boss.StageData

# カウントダウン用: 終了予定時刻 -20, -40, -60, -100, 200 tのとき表示
scoreboard players remove @e[tag=arena.boss.Stage-Core] Arena.Temp 20
execute as @e[tag=arena.boss.Stage-Core] if score #CurrentTick Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick-Max Arena.Temp at @s run function arena_boss:misc/timer/countdown {Countdown:1}

scoreboard players remove @e[tag=arena.boss.Stage-Core] Arena.Temp 20
execute as @e[tag=arena.boss.Stage-Core] if score #CurrentTick Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick-Max Arena.Temp at @s run function arena_boss:misc/timer/countdown {Countdown:2}

scoreboard players remove @e[tag=arena.boss.Stage-Core] Arena.Temp 20
execute as @e[tag=arena.boss.Stage-Core] if score #CurrentTick Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick-Max Arena.Temp at @s run function arena_boss:misc/timer/countdown {Countdown:3}

scoreboard players remove @e[tag=arena.boss.Stage-Core] Arena.Temp 20
execute as @e[tag=arena.boss.Stage-Core] if score #CurrentTick Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick-Max Arena.Temp at @s run function arena_boss:misc/timer/countdown {Countdown:4}

scoreboard players remove @e[tag=arena.boss.Stage-Core] Arena.Temp 20
execute as @e[tag=arena.boss.Stage-Core] if score #CurrentTick Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick-Max Arena.Temp at @s run function arena_boss:misc/timer/countdown {Countdown:5}

scoreboard players remove @e[tag=arena.boss.Stage-Core] Arena.Temp 100
execute as @e[tag=arena.boss.Stage-Core] if score #CurrentTick Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick-Max Arena.Temp at @s run function arena_boss:misc/timer/countdown {Countdown:10}

# スコアのリセット
execute as @e[tag=arena.boss.Stage-Core] run scoreboard players reset @s Arena.Temp

# 20t後に再起schedule
execute as @e[tag=arena.boss.Stage-Core] if data entity @s {data:{Arena:{Timer:{WaveWaiting:true}}}} run schedule function arena_boss:misc/timer/scheduler 20t

