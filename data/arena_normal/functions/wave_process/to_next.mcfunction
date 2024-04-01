## 20t遅延処理
# 開始タイマー関連処理
execute store result score #Endtick arena.temp run time query gametime
scoreboard players add #Endtick arena.temp 200

execute store result entity @e[tag=arena.temp.StageSelection,limit=1] data.arena.timer.Endtick int 1 run scoreboard players get #Endtick arena.temp

data modify entity @e[tag=arena.temp.StageSelection,limit=1] data.arena.timer.WaveWaiting set value true
schedule function arena_normal:misc/wave_timer 1s

# 
