## 20t遅延処理
# 開始タイマー関連処理
execute store result score #EndTick Arena.Temp run time query gametime
scoreboard players add #EndTick Arena.Temp 200

execute store result entity @e[tag=Arena.Temp.StageSelection,limit=1] data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp

data modify entity @e[tag=Arena.Temp.StageSelection,limit=1] data.Arena.Timer.WaveWaiting set value true
schedule function arena_normal:misc/wave_timer 1s

# 