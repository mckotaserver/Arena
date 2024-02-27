## 特定の向きのブロックの個数を検知
# 検知範囲を超えた場合は再起停止
execute unless block ~ ~ ~ barrel run return 0

# 判定方法によってブロック数を数え上げ
$execute if data storage arena_dungeon:temp {block_detection:{count_filled:false}} if block ~ ~ ~ barrel{Items:[{id:"minecraft:stone",tag:{arena_dungeon_generation:{filled:false}}}]} run scoreboard players add #$(score_holder) Arena.Temp 1
$execute if data storage arena_dungeon:temp {block_detection:{count_filled:true}} run scoreboard players add #$(score_holder) Arena.Temp 1

# 再起
execute positioned ^ ^ ^1 run function arena_dungeon:generation/block_detection with storage arena_dungeon:temp block_detection
