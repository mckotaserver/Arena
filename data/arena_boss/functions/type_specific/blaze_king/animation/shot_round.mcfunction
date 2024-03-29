## アニメーション Tick処理: "shot_round"

function arena_boss:type_specific/blaze_king/misc/float
function arena_boss:type_specific/blaze_king/misc/particle_angry

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 0 run playsound entity.illusioner.prepare_blindness master @a ~ ~ ~ 5 0.75
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 0 run playsound minecraft:entity.warden.death master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 0 run playsound minecraft:entity.generic.extinguish_fire master @a ~ ~ ~ 5 0.5

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 0 run data modify entity @s data.arena.boss.OperationData.Flags.NoMove set value true
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 0..20 run function arena_boss:type_specific/blaze_king/misc/spin_normal

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20 run summon marker ~ ~ ~ {Tags:["arena.boss.Main.Extra-03","arena.boss.Main.Extras"],Rotation:[0.0f,0.0f]}

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20..79 as @e[tag=arena.boss.Main.Extra-03,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ ~12 0
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20..79 at @e[tag=arena.boss.Main.Extra-03,sort=nearest,limit=1] run summon item_display ^ ^ ^1 {Tags:["arena.boss.Main.Extra-07","arena.boss.Main.Extras"],Passengers:[{id: "minecraft:small_fireball",Tags:["arena.boss.Main.Extra-08","arena.boss.Main.Extras"]}]}

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20..79 run playsound item.firecharge.use master @a ~ ~ ~ 1 0.75

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20.. as @e[tag=arena.boss.Main.Extra-07,distance=..64] at @s run tp @s ^ ^ ^-0.5 facing entity @e[tag=arena.boss.Main.Extra-03,sort=nearest,limit=1]

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20.. at @e[tag=arena.boss.Main.Extra-07,distance=..64] as @a[tag=arena.boss.player,dx=0] positioned ~ ~ ~0.5 as @s[dx=0] run damage @s 20 magic

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 21..50 run function arena_boss:type_specific/blaze_king/misc/spin_fastest

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 30 run playsound entity.illusioner.mirror_move master @a ~ ~ ~ 5 0.75

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 51..80 run function arena_boss:type_specific/blaze_king/misc/spin_fast

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 80 run kill @e[tag=arena.boss.Main.Extra-05,distance=..64]
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 80 run kill @e[tag=arena.boss.Main.Extra-04,distance=..64]
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 80 run kill @e[tag=arena.boss.Main.Extra-03,distance=..64]

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 80 run data modify entity @s data.arena.boss.OperationData.Flags.NoMove set value false

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 80 run function arena_boss:type_specific/blaze_king/animation/reset

