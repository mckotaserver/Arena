## アニメーション Tick処理: "escape"

function arena_boss:type_specific/blaze_king/misc/float
function arena_boss:type_specific/blaze_king/misc/particle_angry

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0 run playsound entity.illusioner.prepare_blindness master @a ~ ~ ~ 5 0.75
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0 run playsound entity.blaze.ambient master @a ~ ~ ~ 5 0.75

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0..20 run function arena_boss:type_specific/blaze_king/misc/spin_fast
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 20..30 run function arena_boss:type_specific/blaze_king/misc/spin_fastest

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 20 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:0f}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 22 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:15f}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 24 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:0f}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 26 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:-15f}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 28 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:0f}

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 30 run function arena_boss:type_specific/blaze_king/animation/reset

