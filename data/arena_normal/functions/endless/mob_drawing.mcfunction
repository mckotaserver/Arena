## エンドレス: モブ抽選
# 乱数を生成
execute store result score #Endless.mob_type arena.temp run random value 0..99
execute store result score #Endless.mob_typeCount arena.temp run data get storage arena:assets stage_data

scoreboard players operation #Endless.mob_type arena.temp %= #Endless.mob_typeCount arena.temp

execute store result entity @s data.arena.stage_data.mob_type int 1 run scoreboard players get #Endless.mob_type arena.temp
