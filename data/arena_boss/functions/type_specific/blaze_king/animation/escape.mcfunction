## アニメーション Tick処理: "escape"

function arena_boss:type_specific/blaze_king/misc/float
function arena_boss:type_specific/blaze_king/misc/particle_angry

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound entity.blaze.death master @a ~ ~ ~ 5 0.75
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound entity.blaze.ambient master @a ~ ~ ~ 5 1.75

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound minecraft:entity.warden.death master @a ~ ~ ~ 5 0.75

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 5 run effect give @a[tag=Arena.Boss.Player,distance=..6] darkness 15 0
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 10 run effect give @a[tag=Arena.Boss.Player,distance=..5] slowness 15 1

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 15 run effect give @a[tag=Arena.Boss.Player,distance=..4] levitation 5 1
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 15 run effect give @a[tag=Arena.Boss.Player,distance=..4] wither 10 1

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 5 as @a[tag=Arena.Boss.Player,distance=..4] run damage @s 10.0 arena_boss:bypasses_cooldown by @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1]
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 10 as @a[tag=Arena.Boss.Player,distance=..4] run damage @s 10.0 arena_boss:bypasses_cooldown by @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1]

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 20 run particle crimson_spore ~ ~ ~ 2 2 2 1 100

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0..20 run function arena_boss:type_specific/blaze_king/misc/spin_fastest

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 30 run playsound entity.illusioner.mirror_move master @a ~ ~ ~ 5 0.75

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 30 run tp @e[tag=Arena.Boss.Main.Element,distance=..4] @e[tag=Arena.Boss.EscapePos,sort=random,limit=1,distance=2..]
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 30 run scoreboard players set @s Arena.Temp 0

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 21..30 run function arena_boss:type_specific/blaze_king/misc/spin_fast

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 30 run function arena_boss:type_specific/blaze_king/animation/reset

