# エンドレス時のステータス倍率設定
execute store result score $Temp.AttributesMultiple Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave -8
scoreboard players add $Temp.AttributesMultiple Arena 100

execute store result score $Temp.AttackDamage Arena run data get storage arena: Temp.MobInfo.AttackDamage 100
execute store result score $Temp.Speed Arena run data get storage arena: Temp.MobInfo.Speed 100
execute store result score $Temp.Health Arena run data get storage arena: Temp.MobInfo.Health 100
execute store result score $Temp.SummonCount Arena run data get storage arena: Temp.MobInfo.Health 100

scoreboard players operation $Temp.AttackDamage Arena *= $Temp.AttributesMultiple Arena
scoreboard players operation $Temp.Health Arena *= $Temp.AttributesMultiple Arena

scoreboard players operation $Temp.AttackDamage Arena /= #100 Arena
scoreboard players operation $Temp.Health Arena /= #100 Arena


execute store result score $Temp.AttributesMultiple Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave -5
scoreboard players add $Temp.AttributesMultiple Arena 100

scoreboard players operation $Temp.Speed Arena *= $Temp.AttributesMultiple Arena
scoreboard players operation $Temp.Speed Arena /= #100 Arena


execute if score $Temp.Speed Arena matches 41.. run scoreboard players set $Temp.Speed Arena 40

execute store result storage arena: Temp.MobInfo.AttackDamage double 0.01 run scoreboard players get $Temp.AttackDamage Arena
execute store result storage arena: Temp.MobInfo.Speed double 0.01 run scoreboard players get $Temp.Speed Arena
execute store result storage arena: Temp.MobInfo.Health double 0.006 run scoreboard players get $Temp.Health Arena
