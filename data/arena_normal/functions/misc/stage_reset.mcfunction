## ステージのリセット
#> データの初期化
# isEmpty → true
data modify entity @s data.Arena.isEmpty set value true

# 各種data
data modify entity @s data.Arena.stage_data set value {}
data modify entity @s data.Arena.stage_data.wave set value 0

#> エンティティ除去
# Mob
tp @e[tag=Arena.Normal-Stage.Mob,distance=..64] ~ -300 ~
execute positioned ~ -300 ~ as @e[tag=Arena.Normal-Stage.Mob,distance=..4] run data modify entity @s Health set value 0f

# 指定のエンティティを消去
kill @e[type=#arena_normal:resetting_entity,distance=..48]


#> マーカーが存在しない場合
# Arena.Normal-Stage.SpawnMarker
data modify storage arena_normal:temp MarkerExistance set value true

execute positioned ~21 ~ ~ unless entity @e[tag=Arena.Normal-Stage.SpawnMarker,distance=..2] run data modify storage arena_normal:temp MarkerExistance set value false
execute positioned ~-21 ~ ~ unless entity @e[tag=Arena.Normal-Stage.SpawnMarker,distance=..2] run data modify storage arena_normal:temp MarkerExistance set value false
execute positioned ~ ~ ~21 unless entity @e[tag=Arena.Normal-Stage.SpawnMarker,distance=..2] run data modify storage arena_normal:temp MarkerExistance set value false
execute positioned ~ ~ ~-21 unless entity @e[tag=Arena.Normal-Stage.SpawnMarker,distance=..2] run data modify storage arena_normal:temp MarkerExistance set value false

execute if data storage arena_normal:temp {MarkerExistance:false} run kill @e[tag=Arena.Normal-Stage.SpawnMarker,distance=..48]

execute if data storage arena_normal:temp {MarkerExistance:false} run summon marker ~21 ~ ~ {Tags:["Arena.Normal-Stage.SpawnMarker"]}
execute if data storage arena_normal:temp {MarkerExistance:false} run summon marker ~-21 ~ ~ {Tags:["Arena.Normal-Stage.SpawnMarker"]}
execute if data storage arena_normal:temp {MarkerExistance:false} run summon marker ~ ~ ~21 {Tags:["Arena.Normal-Stage.SpawnMarker"]}
execute if data storage arena_normal:temp {MarkerExistance:false} run summon marker ~ ~ ~-21 {Tags:["Arena.Normal-Stage.SpawnMarker"]}
    
execute as @e[tag=Arena.Normal-Stage.SpawnMarker,distance=..48] at @s run tp @s ~ ~ ~ facing entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1]
