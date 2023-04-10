# 手下ブレイズ召喚
# タイマー増加
scoreboard players add $AnimationTimer ArenaBoss 1

# ここからアニメーション
# 
# 回転
execute if score $AnimationTimer ArenaBoss matches 1..10 run function arena-boss:animation/fire/body_spin/fast
execute if score $AnimationTimer ArenaBoss matches 11..30 run function arena-boss:animation/fire/body_spin/fastest
execute if score $AnimationTimer ArenaBoss matches 31..40 run function arena-boss:animation/fire/body_spin/fast

# 演出
execute if score $AnimationTimer ArenaBoss matches 1 run playsound entity.blaze.ambient master @a ~ ~ ~ 1 0.66
execute if score $AnimationTimer ArenaBoss matches 1 run playsound entity.blaze.ambient master @a ~ ~ ~ 1 2

execute if score $AnimationTimer ArenaBoss matches 20 run playsound entity.blaze.death master @a ~ ~ ~ 2 1.2
execute if score $AnimationTimer ArenaBoss matches 30 run playsound entity.wither_skeleton.death master @a ~ ~ ~ 2 0.8

execute if score $AnimationTimer ArenaBoss matches 20 run particle end_rod ~ ~ ~ 0 0 0 0.15 50

# 規定数より多ければ回復に転用
execute store result score $MinionCount ArenaBoss.Temp if entity @e[tag=ArenaBoss.Minion,distance=..64]
data modify storage arena-boss: SummonMinion set value false
execute if score $MinionCount ArenaBoss.Temp matches ..12 run data modify storage arena-boss: SummonMinion set value true

execute store result score $Health ArenaBoss.Temp run data get storage arena-boss: Health 100
scoreboard players add $Health ArenaBoss.Temp 24000

execute if data storage arena-boss: {SummonMinion:false} store result storage arena-boss: Health float 0.01 run scoreboard players get $Health ArenaBoss.Temp
execute if data storage arena-boss: {SummonMinion:false} run tag @e[tag=ArenaBoss.Minion,limit=4,sort=random] add ArenaBoss.Temp

execute if data storage arena-boss: {SummonMinion:false} at @e[tag=ArenaBoss.Core] run playsound entity.elder_guardian.curse master @a ~ ~ ~ 2 1.47
execute if data storage arena-boss: {SummonMinion:false} at @e[tag=ArenaBoss.Core] run playsound entity.player.levelup master @a ~ ~ ~ 2 1.8

execute if data storage arena-boss: {SummonMinion:false} at @e[tag=ArenaBoss.Temp] run particle minecraft:sculk_soul ~ ~ ~ 1 1 1 0.1 15

execute if data storage arena-boss: {SummonMinion:false} run kill @e[tag=ArenaBoss.Temp]

execute if data storage arena-boss: {SummonMinion:false} run function arena-boss:animation/reset

# 召喚
execute if score $AnimationTimer ArenaBoss matches 20 run summon blaze ~ ~ ~ {Tags:["ArenaBoss.Minion"],Motion:[1.0d,0.25d,0.0d],ActiveEffects:[{Id:5,Duration:-1,Amplifier:4b,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.4},{Name:"minecraft:generic.max_health",Base:240.0d}],Health:200.0f,DeathLootTable:"empty"}
execute if score $AnimationTimer ArenaBoss matches 20 run summon blaze ~ ~ ~ {Tags:["ArenaBoss.Minion"],Motion:[-1.0d,0.25d,0.0d],ActiveEffects:[{Id:5,Duration:-1,Amplifier:4b,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.4},{Name:"minecraft:generic.max_health",Base:240.0d}],Health:200.0f,DeathLootTable:"empty"}
execute if score $AnimationTimer ArenaBoss matches 20 run summon blaze ~ ~ ~ {Tags:["ArenaBoss.Minion"],Motion:[0.0d,0.25d,1.0d],ActiveEffects:[{Id:5,Duration:-1,Amplifier:4b,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.4},{Name:"minecraft:generic.max_health",Base:240.0d}],Health:200.0f,DeathLootTable:"empty"}
execute if score $AnimationTimer ArenaBoss matches 20 run summon blaze ~ ~ ~ {Tags:["ArenaBoss.Minion"],Motion:[0.0d,0.25d,-1.0d],ActiveEffects:[{Id:5,Duration:-1,Amplifier:4b,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.4},{Name:"minecraft:generic.max_health",Base:240.0d}],Health:200.0f,DeathLootTable:"empty"}

execute if score $AnimationTimer ArenaBoss matches 30 run summon wither_skeleton ~ ~ ~ {Tags:["ArenaBoss.Minion"],Motion:[1.0d,0.25d,1.0d],ActiveEffects:[{Id:14,Duration:-1,Amplifier:0b,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.35},{Name:"minecraft:generic.max_health",Base:120.0d},{Name:"minecraft:generic.attack_knockback",Base:2.0d},{Name:"minecraft:generic.attack_damage",Base:24.0d},{Name:"minecraft:generic.knockback_resistance",Base:0.7d}],Health:180.0f,DeathLootTable:"empty",HandItems:[{id:"minecraft:netherite_hoe",Count:1b,tag:{Enchantments:[{id:"minecraft:fire_aspect",lvl:3s}]}},{}],ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-486063810,-1533325354,-1397861042,-2147393798],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTFmNGY0ZGMzYjA5ODQ4MWQ4MTc1ZDg0ODkyYzE0NjM3ODU5YWNlNmI1MjQxN2Q0ZWRmZWRmNThlNmRiNTRmOSJ9fX0="}]}}}}],HandDropChances:[-1e40f,-1e40f],ArmorDropChances:[-1e40f,-1e40f,-1e40f,-1e40f]}
execute if score $AnimationTimer ArenaBoss matches 30 run summon wither_skeleton ~ ~ ~ {Tags:["ArenaBoss.Minion"],Motion:[-1.0d,0.25d,1.0d],ActiveEffects:[{Id:14,Duration:-1,Amplifier:0b,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.35},{Name:"minecraft:generic.max_health",Base:120.0d},{Name:"minecraft:generic.attack_knockback",Base:2.0d},{Name:"minecraft:generic.attack_damage",Base:24.0d},{Name:"minecraft:generic.knockback_resistance",Base:0.7d}],Health:180.0f,DeathLootTable:"empty",HandItems:[{id:"minecraft:netherite_hoe",Count:1b,tag:{Enchantments:[{id:"minecraft:fire_aspect",lvl:3s}]}},{}],ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-486063810,-1533325354,-1397861042,-2147393798],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTFmNGY0ZGMzYjA5ODQ4MWQ4MTc1ZDg0ODkyYzE0NjM3ODU5YWNlNmI1MjQxN2Q0ZWRmZWRmNThlNmRiNTRmOSJ9fX0="}]}}}}],HandDropChances:[-1e40f,-1e40f],ArmorDropChances:[-1e40f,-1e40f,-1e40f,-1e40f]}
execute if score $AnimationTimer ArenaBoss matches 30 run summon wither_skeleton ~ ~ ~ {Tags:["ArenaBoss.Minion"],Motion:[1.0d,0.25d,-1.0d],ActiveEffects:[{Id:14,Duration:-1,Amplifier:0b,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.35},{Name:"minecraft:generic.max_health",Base:120.0d},{Name:"minecraft:generic.attack_knockback",Base:2.0d},{Name:"minecraft:generic.attack_damage",Base:24.0d},{Name:"minecraft:generic.knockback_resistance",Base:0.7d}],Health:180.0f,DeathLootTable:"empty",HandItems:[{id:"minecraft:netherite_hoe",Count:1b,tag:{Enchantments:[{id:"minecraft:fire_aspect",lvl:3s}]}},{}],ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-486063810,-1533325354,-1397861042,-2147393798],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTFmNGY0ZGMzYjA5ODQ4MWQ4MTc1ZDg0ODkyYzE0NjM3ODU5YWNlNmI1MjQxN2Q0ZWRmZWRmNThlNmRiNTRmOSJ9fX0="}]}}}}],HandDropChances:[-1e40f,-1e40f],ArmorDropChances:[-1e40f,-1e40f,-1e40f,-1e40f]}
execute if score $AnimationTimer ArenaBoss matches 30 run summon wither_skeleton ~ ~ ~ {Tags:["ArenaBoss.Minion"],Motion:[-1.0d,0.25d,-1.0d],ActiveEffects:[{Id:14,Duration:-1,Amplifier:0b,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.35},{Name:"minecraft:generic.max_health",Base:120.0d},{Name:"minecraft:generic.attack_knockback",Base:2.0d},{Name:"minecraft:generic.attack_damage",Base:24.0d},{Name:"minecraft:generic.knockback_resistance",Base:0.7d}],Health:180.0f,DeathLootTable:"empty",HandItems:[{id:"minecraft:netherite_hoe",Count:1b,tag:{Enchantments:[{id:"minecraft:fire_aspect",lvl:3s}]}},{}],ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-486063810,-1533325354,-1397861042,-2147393798],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTFmNGY0ZGMzYjA5ODQ4MWQ4MTc1ZDg0ODkyYzE0NjM3ODU5YWNlNmI1MjQxN2Q0ZWRmZWRmNThlNmRiNTRmOSJ9fX0="}]}}}}],HandDropChances:[-1e40f,-1e40f],ArmorDropChances:[-1e40f,-1e40f,-1e40f,-1e40f]}

# リセット
execute if score $AnimationTimer ArenaBoss matches 40 run function arena-boss:animation/reset

# その他
function arena-boss:animation/fire/particle/regular

# 動き停止
execute if score $AnimationTimer ArenaBoss matches 1 run data modify storage arena-boss: Animation.Flag.NoMove set value true
