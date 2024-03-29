## アニメーション Tick処理: "explode_minion"

function arena_boss:type_specific/blaze_king/misc/spin_fast
function arena_boss:type_specific/blaze_king/misc/float
function arena_boss:type_specific/blaze_king/misc/particle_angry

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 0 run playsound entity.blaze.death master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 0 run playsound block.enchantment_table.use master @a ~ ~ ~ 5 0.75

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20 as @e[tag=arena.boss.Main.Extra-02,distance=..64] at @s if entity @a[tag=arena.boss.player,distance=..4] if predicate arena_utility:random_chance/1-04 run tag @s add arena.boss.Main.Extra-10

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20 as @e[tag=arena.boss.Main.Extra-10,distance=..64] at @s run damage @s 20 magic by @s
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20 as @e[tag=arena.boss.Main.Extra-10,distance=..64] at @s run effect give @a[tag=arena.boss.player,distance=..4] mining_fatigue 10 1

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20 as @e[tag=arena.boss.Main.Extra-10,distance=..64] at @s run particle explosion_emitter ~ ~ ~ 0 0 0 0 1
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20 as @e[tag=arena.boss.Main.Extra-10,distance=..64] at @s run kill @s

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 60 run function arena_boss:type_specific/blaze_king/animation/reset

