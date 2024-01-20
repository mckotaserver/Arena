## アニメーション Tick処理: "summon_minion"

function arena_boss:type_specific/blaze_king/misc/float
function arena_boss:type_specific/blaze_king/misc/particle_normal

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound entity.blaze.ambient master @a ~ ~ ~ 5 0.75
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound entity.blaze.ambient master @a ~ ~ ~ 5 0.875

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0..10 run function arena_boss:type_specific/blaze_king/misc/spin_normal

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 10 run playsound entity.wither_skeleton.hurt master @a ~ ~ ~ 5 0.75
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 20 run playsound entity.wither_skeleton.hurt master @a ~ ~ ~ 5 0.75

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 11..40 run function arena_boss:type_specific/blaze_king/misc/spin_fast

# 召喚
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 30 run summon wither_skeleton ~ ~ ~ {Motion:[1.0d, 0.25d, 0.0d] ,Tags: ["Arena.Boss.Main.Extra-02", "Arena.Boss.Main.Extras"], Health: 150.0f, Attributes: [{Name: "minecraft:generic.attack_damage",Base: 12.0d},{Name: "minecraft:generic.max_health",Base: 150.0d}], HandItems:[{id: "minecraft:diamond_pickaxe", Count: 1b},{}], HandDropChances: [-1E40f, 0.0f], ArmorItems: [{}, {}, {}, {id :"minecraft:netherite_helmet", Count: 1b}], ArmorDropChances: [0.0f, 0.0f, 0.0f, -1E40f]}
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 30 run summon wither_skeleton ~ ~ ~ {Motion:[-1.0d, 0.25d, 0.0d] ,Tags: ["Arena.Boss.Main.Extra-02", "Arena.Boss.Main.Extras"], Health: 150.0f, Attributes: [{Name: "minecraft:generic.attack_damage",Base: 12.0d},{Name: "minecraft:generic.max_health",Base: 150.0d}], HandItems:[{id: "minecraft:diamond_pickaxe", Count: 1b},{}], HandDropChances: [-1E40f, 0.0f], ArmorItems: [{}, {}, {}, {id :"minecraft:netherite_helmet", Count: 1b}], ArmorDropChances: [0.0f, 0.0f, 0.0f, -1E40f]}
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 30 run summon wither_skeleton ~ ~ ~ {Motion:[0.0d, 0.25d, 1.0d] ,Tags: ["Arena.Boss.Main.Extra-02", "Arena.Boss.Main.Extras"], Health: 150.0f, Attributes: [{Name: "minecraft:generic.attack_damage",Base: 12.0d},{Name: "minecraft:generic.max_health",Base: 150.0d}], HandItems:[{id: "minecraft:diamond_pickaxe", Count: 1b},{}], HandDropChances: [-1E40f, 0.0f], ArmorItems: [{}, {}, {}, {id :"minecraft:netherite_helmet", Count: 1b}], ArmorDropChances: [0.0f, 0.0f, 0.0f, -1E40f]}
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 30 run summon wither_skeleton ~ ~ ~ {Motion:[0.0d, 0.25d, -1.0d] ,Tags: ["Arena.Boss.Main.Extra-02", "Arena.Boss.Main.Extras"], Health: 150.0f, Attributes: [{Name: "minecraft:generic.attack_damage",Base: 12.0d},{Name: "minecraft:generic.max_health",Base: 150.0d}], HandItems:[{id: "minecraft:diamond_pickaxe", Count: 1b},{}], HandDropChances: [-1E40f, 0.0f], ArmorItems: [{}, {}, {}, {id :"minecraft:netherite_helmet", Count: 1b}], ArmorDropChances: [0.0f, 0.0f, 0.0f, -1E40f]}

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 40 run summon blaze ~ ~ ~ {Motion:[0.75d, 0.25d, 0.75d] ,Tags: ["Arena.Boss.Main.Extra-02", "Arena.Boss.Main.Extras"], Health: 100.0f, Attributes: [{Name: "minecraft:generic.attack_damage",Base: 10.0d},{Name: "minecraft:generic.max_health",Base: 100.0d}]}
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 40 run summon blaze ~ ~ ~ {Motion:[-0.75d, 0.25d, 0.75d] ,Tags: ["Arena.Boss.Main.Extra-02", "Arena.Boss.Main.Extras"], Health: 100.0f, Attributes: [{Name: "minecraft:generic.attack_damage",Base: 10.0d},{Name: "minecraft:generic.max_health",Base: 100.0d}]}
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 40 run summon blaze ~ ~ ~ {Motion:[0.75d, 0.25d, -0.75d] ,Tags: ["Arena.Boss.Main.Extra-02", "Arena.Boss.Main.Extras"], Health: 100.0f, Attributes: [{Name: "minecraft:generic.attack_damage",Base: 10.0d},{Name: "minecraft:generic.max_health",Base: 100.0d}]}
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 40 run summon blaze ~ ~ ~ {Motion:[-0.75d, 0.25d, -0.75d] ,Tags: ["Arena.Boss.Main.Extra-02", "Arena.Boss.Main.Extras"], Health: 100.0f, Attributes: [{Name: "minecraft:generic.attack_damage",Base: 10.0d},{Name: "minecraft:generic.max_health",Base: 100.0d}]}

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 41..60 run function arena_boss:type_specific/blaze_king/misc/spin_normal

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 60 run function arena_boss:type_specific/blaze_king/animation/reset

