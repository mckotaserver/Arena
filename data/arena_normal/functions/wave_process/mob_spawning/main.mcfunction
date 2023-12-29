## 召喚 (メイン)
# summon
$summon $(id) ~ ~ ~ $(data)

#> attributes等を設定
data modify storage arena:temp SpawningData.DataModifier set value {}

# 倍率の設定
execute store result storage arena:temp SpawningData.DataModifier.Wave int 1 run data get entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.Wave 0.9999
data modify storage arena:temp SpawningData.Difficulty set from entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.StageData.Difficulty

execute store result score #DataModifier-Unique Arena.Temp run data get storage arena:temp SpawningData.SelectedMob.Multiplier 100

execute if data storage arena:temp {SpawningData:{Difficulty:0}} run scoreboard players set #SpawnDataModifier Arena.Temp 80
execute if data storage arena:temp {SpawningData:{Difficulty:1}} run scoreboard players set #SpawnDataModifier Arena.Temp 130
execute if data storage arena:temp {SpawningData:{Difficulty:2}} run scoreboard players set #SpawnDataModifier Arena.Temp 180

scoreboard players operation #SpawnDataModifier Arena.Temp *= #DataModifier-Unique Arena.Temp
execute store result storage arena:temp SpawningData.DataModifier.Multiplier float 0.0001 run scoreboard players get #SpawnDataModifier Arena.Temp

data modify storage arena:temp SpawningData.Detail-Original set from entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.Spawning.Detail

function arena_normal:wave_process/mob_spawning/data_modifier with storage arena:temp SpawningData.DataModifier

# 初期値 => 0
attribute @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] generic.max_health base set 0
attribute @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] generic.attack_damage base set 0
attribute @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] generic.movement_speed base set 0

attribute @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] generic.follow_range base set 64

# 倍率適応後のデータを代入
execute store result entity @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.max_health"}].Base double 0.01 run data get storage arena:temp SpawningData.Detail-Modified.health 100
execute store result entity @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.attack_damage"}].Base double 0.01 run data get storage arena:temp SpawningData.Detail-Modified.strength 100
execute store result entity @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] Attributes[{Name:"minecraft:generic.movement_speed"}].Base double 0.01 run data get storage arena:temp SpawningData.Detail-Modified.speed 100

# attributesから攻撃力設定ができないmob → エフェクトで対応
execute if data storage arena:temp {SpawningData:{SelectedMob:{id:"minecraft:skeleton"}}} run effect give @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] strength infinite 0 true
execute if data storage arena:temp {SpawningData:{SelectedMob:{id:"minecraft:guardian"}}} run effect give @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] strength infinite 0 true
execute if data storage arena:temp {SpawningData:{SelectedMob:{id:"minecraft:elder_guardian"}}} run effect give @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] strength infinite 0 true

execute store result entity @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] active_effects[{id:"minecraft:strength"}].amplifier byte 0.9999 run data get storage arena:temp SpawningData.DataModifier 

# モブ固有データを設定
execute if data storage arena:temp {SpawningData:{SelectedMob:{id:"minecraft:creeper"}}} store result entity @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] ExplosionRadius byte 1 run data get storage arena:temp SpawningData.Detail-Modified.ExplosionRadius

# 体力設定 (最大に)
data modify entity @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] Health set value 1024.0f

# spreadplayers
execute as @e[tag=Arena.Normal-Stage.Mob,sort=nearest,limit=1] positioned ^ ^ ^6 run spreadplayers ~ ~ 1.5 1.5 under -40 false @s

