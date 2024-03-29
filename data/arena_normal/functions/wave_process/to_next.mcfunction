## 20t遅延処理
# 開始タイマー関連処理
execute store result score #EndTick arena.temp run time query gametime
scoreboard players add #EndTick arena.temp 200

execute store result entity @e[tag=arena.temp.StageSelection,limit=1] data.arena.timer.EndTick int 1 run scoreboard players get #EndTick arena.temp

data modify entity @e[tag=arena.temp.StageSelection,limit=1] data.arena.timer.WaveWaiting set value true
schedule function arena_normal:misc/wave_timer 1s

# 
