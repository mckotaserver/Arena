## チケット配布 (10Wave毎)
# 配布枚数の計算
# t = (a)w + (b)
$execute store result score #reward.ticket_count arena.temp run data get entity @s data.arena.stage_data.wave $(proportion_rate)
$scoreboard players add #reward.ticket_count arena.temp $(addition)

# チケット配布
loot give @a[tag=arena.normal_stage.player,distance=..32] loot arena_normal:ticket/hard

