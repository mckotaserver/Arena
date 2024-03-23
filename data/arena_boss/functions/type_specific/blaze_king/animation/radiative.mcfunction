## アニメーション Tick処理: "shot_round"

function arena_boss:type_specific/blaze_king/misc/float
function arena_boss:type_specific/blaze_king/misc/spin_fast
function arena_boss:type_specific/blaze_king/misc/particle_angry

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0 run playsound block.beacon.deactivate master @a ~ ~ ~ 5 0.75
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0 run playsound entity.guardian.death master @a ~ ~ ~ 5 0.75
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0 run playsound entity.blaze.death master @a ~ ~ ~ 5 1

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0 run data modify entity @s data.Arena.boss.OperationData.Flags.NoMove set value true

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0 run summon marker ~ ~ ~ {Tags:["arena.boss.Main.Extra-06","arena.boss.Main.Extras"],Rotation:[0.0f,0.0f]}

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0..30 as @e[tag=arena.boss.Main.Extra-06,sort=nearest,limit=1] at @s run function arena_boss:type_specific/blaze_king/animation/radiative/notice
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0..30 run function arena_boss:type_specific/blaze_king/misc/spin_normal

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 30 run playsound block.beacon.ambient master @a ~ ~ ~ 5 1.25

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 140 run playsound block.anvil.land master @a ~ ~5 ~ 5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 142 run playsound block.anvil.land master @a ~ ~-5 ~ 5 0.5

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 140 run playsound block.beacon.ambient master @a ~ ~ ~ 5 1.5

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 200 run playsound block.glass.break master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 200 run playsound block.fire.extinguish master @a ~ ~ ~ 5 0.75

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 200 run playsound block.beacon.ambient master @a ~ ~ ~ 5 1.75

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 30..140 as @e[tag=arena.boss.Main.Extra-06,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ ~2.5 ~
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 140..200 as @e[tag=arena.boss.Main.Extra-06,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ ~-3 ~
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 200..250 as @e[tag=arena.boss.Main.Extra-06,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ ~2 ~

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 30..250 as @e[tag=arena.boss.Main.Extra-06,sort=nearest,limit=1] at @s rotated ~0 ~ positioned ^ ^ ^1.5 run function arena_boss:type_specific/blaze_king/animation/radiative/_
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 30..250 as @e[tag=arena.boss.Main.Extra-06,sort=nearest,limit=1] at @s rotated ~90 ~ positioned ^ ^ ^1.5 run function arena_boss:type_specific/blaze_king/animation/radiative/_
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 30..250 as @e[tag=arena.boss.Main.Extra-06,sort=nearest,limit=1] at @s rotated ~180 ~ positioned ^ ^ ^1.5 run function arena_boss:type_specific/blaze_king/animation/radiative/_
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 30..250 as @e[tag=arena.boss.Main.Extra-06,sort=nearest,limit=1] at @s rotated ~270 ~ positioned ^ ^ ^1.5 run function arena_boss:type_specific/blaze_king/animation/radiative/_

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 250 run kill @e[tag=arena.boss.Main.Extra-06,sort=nearest,limit=1]

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 250 run data modify entity @s data.Arena.boss.OperationData.Flags.NoMove set value false

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 250 run function arena_boss:type_specific/blaze_king/animation/reset

