#> 前処理
# Timerリセット
data modify entity @s data.Arena.Timer.EndTick set value -1

#> ウェーブ進行処理
# Wave +1
execute store result score #Wave Arena.Temp run data get entity @s data.Arena.Wave
scoreboard players add #Wave Arena.Temp 1

execute store result entity @s data.Arena.Wave int 1 run scoreboard players get #Wave Arena.Temp

#> モブの召喚
# データ参照, 保管
function arena_normal:misc/data_search with entity @s data.Arena.StageData
data modify entity @s data.Arena.Spawning.Detail set from storage arena:temp MatchingStageData

# 召喚数最大値を記録
execute if data entity @s {data:{Arena:{StageData:{Difficulty:0}}}} run scoreboard players set #SpawnDataModifier Arena.Temp 80
execute if data entity @s {data:{Arena:{StageData:{Difficulty:1}}}} run scoreboard players set #SpawnDataModifier Arena.Temp 130
execute if data entity @s {data:{Arena:{StageData:{Difficulty:2}}}} run scoreboard players set #SpawnDataModifier Arena.Temp 180

data modify storage arena:temp ArrayPicking.in set from entity @s data.Arena.Spawning.Detail.summon_count
execute store result storage arena:temp ArrayPicking.index int 1 run data get entity @s data.Arena.Wave 0.9999
function arena_normal:misc/array_picker with storage arena:temp ArrayPicking

execute store result score #SpawnCounter-Max Arena.Temp run data get storage arena:temp ArrayPicking.out
scoreboard players operation #SpawnCounter-Max Arena.Temp *= #SpawnDataModifier Arena.Temp

execute store result entity @s data.Arena.Spawning.Counter int 0.01 run scoreboard players get #SpawnCounter-Max Arena.Temp

# 召喚処理
execute as @e[tag=Arena.Normal-Stage.SpawnMarker,distance=..48,sort=random,limit=1] at @s run function arena_normal:wave_process/mob_spawning/_

#> 演出
# playsound
execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.33 0.5

# Title
title @a title ""
execute if score #Wave Arena.Temp matches 1..4 run title @a subtitle {"translate":"kota-server.arena.game.message.wave_proceeded","with":[{"score":{"name": "#Wave","objective": "Arena.Temp"},"color": "gold"}]}
execute if score #Wave Arena.Temp matches 5 run title @a subtitle {"translate":"kota-server.arena.game.message.wave_proceeded-last"}

