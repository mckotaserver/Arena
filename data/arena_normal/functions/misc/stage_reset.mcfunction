## ステージのリセット
#> データの初期化
# isEmpty → true
data modify entity @s data.arena.isEmpty set value true

# 各種data
data modify entity @s data.arena.stage_data set value {}
data modify entity @s data.arena.stage_data.wave set value 0

#> エンティティ除去
# Mob
tp @e[tag=arena.normal_stage.mob,distance=..64] ~ -300 ~
execute positioned ~ -300 ~ as @e[tag=arena.normal_stage.mob,distance=..4] run data modify entity @s Health set value 0f

# 指定のエンティティを消去
kill @e[type=#arena_normal:resetting_entity,distance=..48]

#> マーカーが存在しない場合
# arena.normal_stage.spawn_marker
data modify storage arena_normal:temp marker_existance set value true

execute positioned ~21 ~ ~ unless entity @e[tag=arena.normal_stage.spawn_marker,distance=..2] run data modify storage arena_normal:temp marker_existance set value false
execute positioned ~-21 ~ ~ unless entity @e[tag=arena.normal_stage.spawn_marker,distance=..2] run data modify storage arena_normal:temp marker_existance set value false
execute positioned ~ ~ ~21 unless entity @e[tag=arena.normal_stage.spawn_marker,distance=..2] run data modify storage arena_normal:temp marker_existance set value false
execute positioned ~ ~ ~-21 unless entity @e[tag=arena.normal_stage.spawn_marker,distance=..2] run data modify storage arena_normal:temp marker_existance set value false

execute if data storage arena_normal:temp {marker_existance:false} run kill @e[tag=arena.normal_stage.spawn_marker,distance=..48]

execute if data storage arena_normal:temp {marker_existance:false} run summon marker ~21 ~ ~ {Tags:["arena.normal_stage.spawn_marker"]}
execute if data storage arena_normal:temp {marker_existance:false} run summon marker ~-21 ~ ~ {Tags:["arena.normal_stage.spawn_marker"]}
execute if data storage arena_normal:temp {marker_existance:false} run summon marker ~ ~ ~21 {Tags:["arena.normal_stage.spawn_marker"]}
execute if data storage arena_normal:temp {marker_existance:false} run summon marker ~ ~ ~-21 {Tags:["arena.normal_stage.spawn_marker"]}

execute as @e[tag=arena.normal_stage.spawn_marker,distance=..48] at @s run tp @s ~ ~ ~ facing entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1]
