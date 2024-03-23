## アニメーション Tick処理: "spawn"

# 魔法陣
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0..120 positioned ~ ~-0.45 ~ run function arena_boss:type_specific/blaze_king/animation/spawn/particle_0
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 30..120 positioned ~ ~-0.45 ~ run function arena_boss:type_specific/blaze_king/animation/spawn/particle_1
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 50..120 positioned ~ ~-0.45 ~ run function arena_boss:type_specific/blaze_king/animation/spawn/particle_2
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 60..120 positioned ~ ~-0.45 ~ run function arena_boss:type_specific/blaze_king/animation/spawn/particle_3
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 100..120 positioned ~ ~-0.45 ~ run function arena_boss:type_specific/blaze_king/animation/spawn/particle_4

# playsound
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0 run playsound minecraft:entity.wither_skeleton.death master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 30 run playsound minecraft:entity.wither_skeleton.death master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 50 run playsound minecraft:entity.wither_skeleton.death master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 60 run playsound minecraft:entity.wither_skeleton.death master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 100 run playsound minecraft:entity.wither_skeleton.death master @a ~ ~ ~ 5 0.5

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0 run playsound minecraft:entity.illusioner.mirror_move master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 30 run playsound minecraft:entity.illusioner.mirror_move master @a ~ ~ ~ 5 0.66
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 50 run playsound minecraft:entity.illusioner.mirror_move master @a ~ ~ ~ 5 0.75
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 60 run playsound minecraft:entity.illusioner.mirror_move master @a ~ ~ ~ 5 0.75
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 100 run playsound minecraft:entity.illusioner.mirror_move master @a ~ ~ ~ 5 1

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120 run playsound entity.generic.explode master @a ~ ~ ~ 5 1
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 110..120 run playsound block.lava.extinguish master @a ~ ~ ~ 5 0.5

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120 run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 0.75

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120 run playsound entity.blaze.hurt master @a ~ ~ ~ 5 0.75

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 150 run playsound block.beacon.deactivate master @a ~ ~ ~ 5 0.5

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 160 run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 0.75
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 160..165 run playsound entity.illusioner.mirror_move master @a ~ ~ ~ 3 0.8


execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120 run summon marker ~ ~2 ~5 {Tags:["arena.boss.Extra.SkillMarker-Spawning","arena.boss.Extras"]}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120 run summon marker ~ ~2 ~-5 {Tags:["arena.boss.Extra.SkillMarker-Spawning","arena.boss.Extras"]}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120 run summon marker ~5 ~2 ~ {Tags:["arena.boss.Extra.SkillMarker-Spawning","arena.boss.Extras"]}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120 run summon marker ~-5 ~2 ~ {Tags:["arena.boss.Extra.SkillMarker-Spawning","arena.boss.Extras"]}

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120.. as @e[tag=arena.boss.Extra.SkillMarker-Spawning,distance=..8] at @s run tp @s ~ ~ ~ facing entity @e[tag=arena.boss.SpawnPos,sort=nearest,limit=1]
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120 as @e[tag=arena.boss.Extra.SkillMarker-Spawning,distance=..8] at @s run tp @s ~ ~ ~ ~ 0

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120.. as @e[tag=arena.boss.Extra.SkillMarker-Spawning,distance=..8] at @s run tp @s ^0.1 ^ ^0.05 ~5 ~

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120..160 at @e[tag=arena.boss.Extra.SkillMarker-Spawning,distance=..8] run particle lava ~ ~ ~ 0 0 0 0 1
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 120.. at @e[tag=arena.boss.Extra.SkillMarker-Spawning,distance=..8] run particle dripping_lava ~ ~ ~ 0.05 0.05 0.05 0 2

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 150.. at @e[tag=arena.boss.Extra.SkillMarker-Spawning,distance=..8] positioned ~ ~-0.5 ~ run particle flame ^ ^ ^-2 ^ ^ ^1000000000 0.0000000001 0
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 150.. at @e[tag=arena.boss.Extra.SkillMarker-Spawning,distance=..8] rotated ~ ~ positioned ~ ~ ~ run particle dust_color_transition 100000000 1 1 1 1 0 0 ^ ^ ^-2 0 0 0 1 0

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 150.. at @e[tag=arena.boss.Extra.SkillMarker-Spawning,distance=..8] rotated ~ ~ positioned ~ ~ ~ run particle portal ^ ^2 ^4 0.05 0.05 0.05 0.2 2

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 140.. at @e[tag=arena.boss.Extra.SkillMarker-Spawning,distance=..8] rotated ~ 0 run particle witch ^ ^ ^5 0.05 0.05 0.05 0 1
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 140.. at @e[tag=arena.boss.Extra.SkillMarker-Spawning,distance=..8] rotated ~ 0 run particle smoke ^ ^ ^5 0.05 0.05 0.05 0 1

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 180 run particle explosion ~ ~ ~ 0 0 0 0 15
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 180 run particle explosion ~ ~ ~ 0 0 0 1 15
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 180 run particle explosion ~ ~ ~ 0 0 0 2 15

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 180 run playsound entity.lightning_bolt.thunder master @a ~ ~ ~51 0.75
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 180 run playsound entity.wither.spawn master @a ~ ~ ~ 1 0.66

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 180 run playsound entity.allay.death master @a ~ ~ ~ 2.5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 180 run playsound block.ender_chest.close master @a ~ ~ ~ 5 0.66

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 180 run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 182 run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 185 run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 5 0.5

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 180 run data modify storage arena_boss:temp SkillParticle set value {Radius:0.25f, Speed:0.0000000075,MotionRadius:100000000,Particle:"soul_fire_flame"}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 180 rotated ~ -30 run function arena_boss:type_specific/blaze_king/animation/spawn/particle_5 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 182 run data modify storage arena_boss:temp SkillParticle set value {Radius:0.125f, Speed:0.000000005,MotionRadius:100000000,Particle:"flame"}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 182 rotated ~ -27 run function arena_boss:type_specific/blaze_king/animation/spawn/particle_5 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 184 run data modify storage arena_boss:temp SkillParticle set value {Radius:0.25f, Speed:0.0000000075,MotionRadius:100000000,Particle:"soul_fire_flame"}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 184 rotated ~ -24 run function arena_boss:type_specific/blaze_king/animation/spawn/particle_5 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 186 run data modify storage arena_boss:temp SkillParticle set value {Radius:0.125f, Speed:0.000000005,MotionRadius:100000000,Particle:"flame"}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 186 rotated ~ -21 run function arena_boss:type_specific/blaze_king/animation/spawn/particle_5 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 188 run data modify storage arena_boss:temp SkillParticle set value {Radius:0.25f, Speed:0.0000000075,MotionRadius:100000000,Particle:"soul_fire_flame"}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 188 rotated ~ -18 run function arena_boss:type_specific/blaze_king/animation/spawn/particle_5 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 190 run data modify storage arena_boss:temp SkillParticle set value {Radius:0.125f, Speed:0.000000005,MotionRadius:100000000,Particle:"flame"}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 190 rotated ~ -15 run function arena_boss:type_specific/blaze_king/animation/spawn/particle_5 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 192 run data modify storage arena_boss:temp SkillParticle set value {Radius:0.25f, Speed:0.0000000075,MotionRadius:100000000,Particle:"soul_fire_flame"}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 192 rotated ~ -12 run function arena_boss:type_specific/blaze_king/animation/spawn/particle_5 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 194 run data modify storage arena_boss:temp SkillParticle set value {Radius:0.125f, Speed:0.000000005,MotionRadius:100000000,Particle:"flame"}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 194 rotated ~ -9 run function arena_boss:type_specific/blaze_king/animation/spawn/particle_5 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 196 run data modify storage arena_boss:temp SkillParticle set value {Radius:0.25f, Speed:0.0000000075,MotionRadius:100000000,Particle:"soul_fire_flame"}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 196 rotated ~ 0 run function arena_boss:type_specific/blaze_king/animation/spawn/particle_5 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 200 run kill @e[tag=arena.boss.Extra.SkillMarker-Spawning,distance=..8]
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 200 as @e[tag=arena.boss.Stage-Core,sort=nearest,limit=1] at @e[tag=arena.boss.SpawnPos,sort=nearest,limit=1] run function arena_boss:type_specific/blaze_king/summon with entity @s data.Arena.boss.StageData

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 180..200 run function arena_boss:type_specific/blaze_king/misc/spin_fastest
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 200..220 run function arena_boss:type_specific/blaze_king/misc/spin_fast

execute as @e[tag=arena.boss.Main.Core,sort=nearest,limit=1,distance=..64] at @s run tp @s ~ ~ ~ ~0.1 ~

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 220 run function arena_boss:type_specific/blaze_king/animation/reset

