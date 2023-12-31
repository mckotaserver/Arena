## エンドレス: モブ抽選
# 乱数を生成
execute store result score #Endless.MobType Arena.Temp run random value 0..99
execute store result score #Endless.MobTypeCount Arena.Temp run data get storage arena:assets stage_data

scoreboard players operation #Endless.MobType Arena.Temp %= #Endless.MobTypeCount Arena.Temp

execute store result entity @s data.Arena.StageData.MobType int 1 run scoreboard players get #Endless.MobType Arena.Temp
