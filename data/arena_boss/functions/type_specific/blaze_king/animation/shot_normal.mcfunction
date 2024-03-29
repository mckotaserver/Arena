## アニメーション Tick処理: "escape"

function arena_boss:type_specific/blaze_king/misc/float
function arena_boss:type_specific/blaze_king/misc/particle_angry

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 0 run playsound entity.illusioner.prepare_blindness master @a ~ ~ ~ 5 0.75
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 0 run playsound entity.blaze.ambient master @a ~ ~ ~ 5 0.75

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 0..20 run function arena_boss:type_specific/blaze_king/misc/spin_fast
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20..35 run function arena_boss:type_specific/blaze_king/misc/spin_fastest


execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 20 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:20f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 21 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:10f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 22 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:0f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 23 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:-10f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 24 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:-20f}

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 25 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:25f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 26 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:15f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 27 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:0f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 28 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:-15f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 29 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:-25f}

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 30 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:20f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 31 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:10f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 32 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:0f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 33 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:-10f}
execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 34 run function arena_boss:type_specific/blaze_king/animation/shot/summon {Rotation:-20f}

execute if score @p[tag=arena.boss.core_player] arenaboss.Timer matches 35 run function arena_boss:type_specific/blaze_king/animation/reset

