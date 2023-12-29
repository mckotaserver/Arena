## 何かしら倒したとき →
# トリガー解除
advancement revoke @s only arena_normal:wave/mob_killed

# 付近にモブがいる = 全討伐していない なら処理中断
execute at @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] if entity @e[tag=Arena.Normal-Stage.Mob,distance=..48] run return -1

#> 終了処理
execute as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] if data entity @s {data:{Arena:{Wave:5}}} at @s run function arena_normal:end/_
execute as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] if data entity @s {data:{Arena:{Wave:5}}} at @s run return -1

# 上記をパスしたなら次ウェーブへ
execute at @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 1

# 開始タイマー関連処理
execute store result score #EndTick Arena.Temp run time query gametime
scoreboard players add #EndTick Arena.Temp 300

execute store result entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp

data modify entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.Timer.WaveWaiting set value true
schedule function arena_normal:misc/wave_timer 1s

# tellraw
execute at @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] run tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_announce"}]

