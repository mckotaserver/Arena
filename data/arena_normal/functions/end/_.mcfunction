## 終了処理
# tellraw
tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.end_announce"}]

# playsound
execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 2
execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2

# 記録関連処理
function arena_normal:recording/_ 

data modify entity @s data.Arena.DisplayRecord set from storage arena:temp Recording.Time.DisplayData
data modify entity @s data.Arena.isNewRecord set from storage arena:temp Recording.Time.DisplayData

# タイマー関連処理
execute store result score #EndTick Arena.Temp run time query gametime
scoreboard players add #EndTick Arena.Temp 300

execute store result entity @s data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp
schedule function arena_normal:end/delay 300t

# チケットの配布
execute if data entity @s {data:{Arena:{StageData:{Difficulty:0}}}} store result score #Reward.TicketCount Arena.Temp run data get entity @s data.Arena.Spawning.Detail.reward[0]
execute if data entity @s {data:{Arena:{StageData:{Difficulty:1}}}} store result score #Reward.TicketCount Arena.Temp run data get entity @s data.Arena.Spawning.Detail.reward[1]
execute if data entity @s {data:{Arena:{StageData:{Difficulty:2}}}} store result score #Reward.TicketCount Arena.Temp run data get entity @s data.Arena.Spawning.Detail.reward[2]
 
execute if data entity @s {data:{Arena:{StageData:{Difficulty:0}}}} as @a[tag=Arena.Normal-Stage.Player,distance=..48] run loot give @s loot arena_normal:ticket/easy
execute if data entity @s {data:{Arena:{StageData:{Difficulty:1}}}} as @a[tag=Arena.Normal-Stage.Player,distance=..48] run loot give @s loot arena_normal:ticket/normal
execute if data entity @s {data:{Arena:{StageData:{Difficulty:2}}}} as @a[tag=Arena.Normal-Stage.Player,distance=..48] run loot give @s loot arena_normal:ticket/hard

# クリア判定抑制のためデータ削除
data modify entity @s data.Arena.Timer.WaveWaiting set value true
