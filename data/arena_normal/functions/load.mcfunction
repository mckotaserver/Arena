## LOAD.
# スコアボード定義 
scoreboard objectives add Arena.StageId dummy
scoreboard objectives add Arena.Temp dummy
scoreboard objectives add arena dummy

scoreboard objectives add Constant dummy

scoreboard players set #5 Constant 5
scoreboard players set #10 Constant 10
scoreboard players set #20 Constant 20
scoreboard players set #60 Constant 60
scoreboard players set #100 Constant 100

#> ステージ情報の設定
# assets読み込み
function arena_normal:assets/stage_data/load

# Marker
execute as @e[tag=Arena.Normal-Stage.Stage-Core] unless data entity @s data.Arena run data merge entity @s {data:{Arena:{isEmpty:true,StageData:{}}}}

execute unless data storage arena:records normal run data modify storage arena:records normal set value [{MobType:0,data:[]},{MobType:1,data:[]},{MobType:2,data:[]},{MobType:3,data:[]}]

# team
team add Arena.Mobs
team modify Arena.Mobs friendlyFire false
