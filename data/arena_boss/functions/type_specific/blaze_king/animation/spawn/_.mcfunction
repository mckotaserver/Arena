## アニメーション Tick処理: "spawn"

# 魔法陣
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0..120 positioned ~ ~-0.45 ~ run function arena_boss:type_specific/blaze_king/animation/spawn/particle_0
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 30..120 positioned ~ ~-0.45 ~ run function arena_boss:type_specific/blaze_king/animation/spawn/particle_1
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 50..120 positioned ~ ~-0.45 ~ run function arena_boss:type_specific/blaze_king/animation/spawn/particle_2
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 60..120 positioned ~ ~-0.45 ~ run function arena_boss:type_specific/blaze_king/animation/spawn/particle_3
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 100..120 positioned ~ ~-0.45 ~ run function arena_boss:type_specific/blaze_king/animation/spawn/particle_4

# playsound
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound minecraft:entity.wither_skeleton.death master @a ~ ~ ~ 5 0.5
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 30 run playsound minecraft:entity.wither_skeleton.death master @a ~ ~ ~ 5 0.5
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 50 run playsound minecraft:entity.wither_skeleton.death master @a ~ ~ ~ 5 0.5
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 60 run playsound minecraft:entity.wither_skeleton.death master @a ~ ~ ~ 5 0.5
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 100 run playsound minecraft:entity.wither_skeleton.death master @a ~ ~ ~ 5 0.5

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound minecraft:entity.illusioner.mirror_move master @a ~ ~ ~ 5 0.5
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 30 run playsound minecraft:entity.illusioner.mirror_move master @a ~ ~ ~ 5 0.66
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 50 run playsound minecraft:entity.illusioner.mirror_move master @a ~ ~ ~ 5 0.75
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 60 run playsound minecraft:entity.illusioner.mirror_move master @a ~ ~ ~ 5 0.75
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 100 run playsound minecraft:entity.illusioner.mirror_move master @a ~ ~ ~ 5 1

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 110..120 run playsound block.lava.extinguish master @a ~ ~ ~ 5 0.5

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120 run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 1

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120 run playsound entity.generic.explode master @a ~ ~ ~ 5 0.75
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120 run playsound entity.blaze.hurt master @a ~ ~ ~ 5 0.75

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 140 run playsound entity.wither.break_block master @a ~ ~ ~ 5 0.5
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 145 run playsound entity.wither.break_block master @a ~ ~ ~ 5 0.5

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 150 run playsound entity.enderman.scream master @a ~ ~ ~ 5 0.75
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 150 run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5



execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120 run summon marker ~ ~2 ~5 {Tags:["Arena.Boss.Extra.SkillMarker-Spawning"]}
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120 run summon marker ~ ~2 ~-5 {Tags:["Arena.Boss.Extra.SkillMarker-Spawning"]}
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120 run summon marker ~5 ~2 ~ {Tags:["Arena.Boss.Extra.SkillMarker-Spawning"]}
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120 run summon marker ~-5 ~2 ~ {Tags:["Arena.Boss.Extra.SkillMarker-Spawning"]}

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120.. as @e[tag=Arena.Boss.Extra.SkillMarker-Spawning,distance=..8] at @s run tp @s ~ ~ ~ facing entity @e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1]
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120 as @e[tag=Arena.Boss.Extra.SkillMarker-Spawning,distance=..8] at @s run tp @s ~ ~ ~ ~ 0

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120.. as @e[tag=Arena.Boss.Extra.SkillMarker-Spawning,distance=..8] at @s run tp @s ^0.1 ^ ^0.05 ~5 ~

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120..160 at @e[tag=Arena.Boss.Extra.SkillMarker-Spawning,distance=..8] run particle lava ~ ~ ~ 0 0 0 0 1
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 120.. at @e[tag=Arena.Boss.Extra.SkillMarker-Spawning,distance=..8] run particle dripping_lava ~ ~ ~ 0.05 0.05 0.05 0 2

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 150.. at @e[tag=Arena.Boss.Extra.SkillMarker-Spawning,distance=..8] rotated ~ 0 positioned ~ ~-0.5 ~ run particle block sculk ^ ^ ^4 0.05 0.05 0.05 0 1

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 140.. at @e[tag=Arena.Boss.Extra.SkillMarker-Spawning,distance=..8] rotated ~ 0 run particle witch ^ ^ ^5 0.05 0.05 0.05 0 1
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 140.. at @e[tag=Arena.Boss.Extra.SkillMarker-Spawning,distance=..8] rotated ~ 0 run particle smoke ^ ^ ^5 0.05 0.05 0.05 0 1

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 220 run kill @e[tag=Arena.Boss.Extra.SkillMarker-Spawning,distance=..8]

execute as @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1,distance=..64] at @s run tp @s ~ ~ ~ ~0.1 ~

# execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 360 run function arena_boss:type_specific/blaze_king/animation/reset

