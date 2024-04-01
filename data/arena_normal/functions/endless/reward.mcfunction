## チケット配布 (10Wave毎)
# 配布枚数の計算
# t = 0.1w + 6
execute store result score #Reward.ticketCount arena.temp run data get entity @s data.arena.stage_data.wave
scoreboard players add #Reward.ticketCount arena.temp 6

# チケット配布
loot give @a[tag=arena.normal_stage.player,distance=..48] loot arena_normal:ticket/hard

