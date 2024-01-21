## アニメーション Tick処理: "explode_minion"

function arena_boss:type_specific/blaze_king/misc/spin_fast
function arena_boss:type_specific/blaze_king/misc/float
function arena_boss:type_specific/blaze_king/misc/particle_angry

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound entity.blaze.death master @a ~ ~ ~ 5 0.5
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 0 run playsound block.enchantment_table.use master @a ~ ~ ~ 5 0.75

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 20 at @e[tag=Arena.Boss.Main.Extra-02,distance=..64] if entity @a[tag=Arena.Boss.Player,distance=..4] as @a[tag=Arena.Boss.Player,distance=..4] run damage @s 40 magic by @e[tag=Arena.Boss.Main.Extra-02,sort=nearest,limit=1]
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 20 at @e[tag=Arena.Boss.Main.Extra-02,distance=..64] if entity @a[tag=Arena.Boss.Player,distance=..4] run effect give @a[tag=Arena.Boss.Player,distance=..4] mining_fatigue 10 1

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 20 at @e[tag=Arena.Boss.Main.Extra-02,distance=..64] if entity @a[tag=Arena.Boss.Player,distance=..4] run particle explosion_emitter ~ ~ ~ 0 0 0 0 1
execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 20 at @e[tag=Arena.Boss.Main.Extra-02,distance=..64] if entity @a[tag=Arena.Boss.Player,distance=..4] run kill @e[tag=Arena.Boss.Main.Extra-02,distance=..64]

execute if score @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer matches 60 run function arena_boss:type_specific/blaze_king/animation/reset

