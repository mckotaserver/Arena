## チケット配布 (10Wave毎)
# 配布枚数の計算
# t = 0.1w + 3
execute store result score #Reward.TicketCount Arena.Temp run data get entity @s data.Arena.Wave
scoreboard players add #Reward.TicketCount Arena.Temp 4

# tellraw
execute at @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] run tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_announce.endless","with":[{"nbt":"data.Arena.Wave","entity":"@e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1]","color": "gold"},{"score":{"name": "#Reward.TicketCount","objective": "Arena.Temp"},"color": "aqua","bold": true}]}]
 
# チケット配布
execute at @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] run loot give @a[tag=Arena.Normal-Stage.Player,distance=..48] loot arena_normal:ticket/hard

