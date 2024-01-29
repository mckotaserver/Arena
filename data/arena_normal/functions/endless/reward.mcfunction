## チケット配布 (10Wave毎)
# 配布枚数の計算
# t = 0.1w + 6
execute store result score #Reward.TicketCount Arena.Temp run data get entity @s data.Arena.StageData.wave
scoreboard players add #Reward.TicketCount Arena.Temp 6

# チケット配布
loot give @a[tag=Arena.Normal-Stage.Player,distance=..48] loot arena_normal:ticket/hard

