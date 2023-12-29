## 終了処理
# tellraw
tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.end_announce"}]

# playsound
execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 0.8
execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2

# 記録関連処理
execute if data entity @s {data:{Arena:{StageData:{Difficulty:2}}}} run function arena_normal:recording/_ 

data modify entity @s data.Arena.DisplayRecord set from storage arena:temp Recording.Compound.DisplayData

# タイマー関連処理
execute store result score #EndTick Arena.Temp run time query gametime
scoreboard players add #EndTick Arena.Temp 300

execute store result entity @s data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp
schedule function arena_normal:end/delay 300t

