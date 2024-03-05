## エンドレス: モブ抽選
# 乱数を生成
execute store result score #Endless.mob_type Arena.Temp run random value 0..99
execute store result score #Endless.mob_typeCount Arena.Temp run data get storage arena:assets stage_data

scoreboard players operation #Endless.mob_type Arena.Temp %= #Endless.mob_typeCount Arena.Temp

execute store result entity @s data.Arena.stage_data.mob_type int 1 run scoreboard players get #Endless.mob_type Arena.Temp
