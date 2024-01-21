## アニメーション Tick処理: "implosion"

function arena_boss:type_specific/blaze_king/misc/particle_angry
function arena_boss:type_specific/blaze_king/misc/spin_fast

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound item.totem.use master @a ~ ~ ~ 5 1.25
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound minecraft:entity.warden.death master @a ~ ~ ~ 5 0.75
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound item.firecharge.use master @a ~ ~ ~ 5 0.75

playsound entity.generic.explode master @a ~ ~ ~ 1 0.8

execute unless entity @p[tag=Arena.Boss.Player,distance=..2] rotated ~ 0 run tp @s ^ ^ ^0.5 facing entity @p[tag=Arena.Boss.Player]
execute unless entity @p[tag=Arena.Boss.Player,distance=..2] positioned as @s run tp @e[tag=Arena.Boss.Main.Element,distance=..4] ~ ~ ~

execute as @a[tag=Arena.Boss.Player,distance=..3] run damage @s 30.0 magic by @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1]

particle explosion ~ ~ ~ 0 0 0 0 1
particle explosion ~ ~ ~ 0 0 0 1 1
particle explosion ~ ~ ~ 0 0 0 1.5 1
particle explosion ~ ~ ~ 0 0 0 1.75 1

particle sonic_boom ~ ~1 ~ 1 1 1 0 1

execute if entity @p[tag=Arena.Boss.Player,distance=..3] run playsound entity.illusioner.mirror_move master @a ~ ~ ~ 5 0.5
execute if entity @p[tag=Arena.Boss.Player,distance=..3] run playsound entity.illusioner.mirror_move master @a ~ ~ ~ 5 1.25

execute if entity @p[tag=Arena.Boss.Player,distance=..3] run function arena_boss:type_specific/blaze_king/animation/start {Animation:"regular"}

