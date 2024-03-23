## アニメーション Tick処理: "implosion"

function arena_boss:type_specific/blaze_king/misc/particle_angry
function arena_boss:type_specific/blaze_king/misc/spin_fast
function arena_boss:type_specific/blaze_king/misc/float

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0 run playsound entity.ender_dragon.hurt master @a ~ ~ ~ 5 1.75
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 0 run playsound entity.illusioner.cast_spell master @a ~ ~ ~ 5 0.75

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 10 run playsound item.firecharge.use master @a ~ ~ ~ 5 0.75
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 3 run playsound entity.evoker_fangs.attack master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 10 run playsound entity.blaze.hurt master @a ~ ~ ~ 5 0.5

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 10 at @a[tag=arena.boss.Player,distance=..64] rotated ~45 0 run summon marker ^ ^ ^5 {Tags:["arena.boss.Extra-09","arena.boss.Extras"]}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 10 at @a[tag=arena.boss.Player,distance=..64] rotated ~135 0 run summon marker ^ ^ ^5 {Tags:["arena.boss.Extra-09","arena.boss.Extras"]}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 10 at @a[tag=arena.boss.Player,distance=..64] rotated ~225 0 run summon marker ^ ^ ^5 {Tags:["arena.boss.Extra-09","arena.boss.Extras"]}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 10 at @a[tag=arena.boss.Player,distance=..64] rotated ~315 0 run summon marker ^ ^ ^5 {Tags:["arena.boss.Extra-09","arena.boss.Extras"]}

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 20 at @a[tag=arena.boss.Player,distance=..64] rotated ~ 0 run summon marker ^ ^ ^7 {Tags:["arena.boss.Extra-09","arena.boss.Extras"]}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 20 at @a[tag=arena.boss.Player,distance=..64] rotated ~90 0 run summon marker ^ ^ ^7 {Tags:["arena.boss.Extra-09","arena.boss.Extras"]}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 20 at @a[tag=arena.boss.Player,distance=..64] rotated ~180 0 run summon marker ^ ^ ^7 {Tags:["arena.boss.Extra-09","arena.boss.Extras"]}
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 20 at @a[tag=arena.boss.Player,distance=..64] rotated ~270 0 run summon marker ^ ^ ^7 {Tags:["arena.boss.Extra-09","arena.boss.Extras"]}

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 10..70 at @e[tag=arena.boss.Extra-09,distance=..64] run particle lava ~ ~ ~ 0 0 0 1 1
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 10..70 at @e[tag=arena.boss.Extra-09,distance=..64] run particle dripping_lava ~ ~0.5 ~ 0.5 0.5 0.5 1 1

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 70..80 as @e[tag=arena.boss.Extra-09,distance=..64] at @s run function arena_boss:type_specific/blaze_king/animation/blazing_pillar/particle_01

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 75 run data modify storage arena_boss:temp SkillParticle.Radius set value 1.0f
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 75 at @e[tag=arena.boss.Extra-09,distance=..64] positioned ~ ~1 ~ run function arena_boss:type_specific/blaze_king/animation/blazing_pillar/particle_02 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 76 run data modify storage arena_boss:temp SkillParticle.Radius set value 1.1f
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 76 at @e[tag=arena.boss.Extra-09,distance=..64] positioned ~ ~1.75 ~ run function arena_boss:type_specific/blaze_king/animation/blazing_pillar/particle_02 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 77 run data modify storage arena_boss:temp SkillParticle.Radius set value 1.2f
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 77 at @e[tag=arena.boss.Extra-09,distance=..64] positioned ~ ~2.5 ~ run function arena_boss:type_specific/blaze_king/animation/blazing_pillar/particle_02 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 78 run data modify storage arena_boss:temp SkillParticle.Radius set value 1.3f
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 78 at @e[tag=arena.boss.Extra-09,distance=..64] positioned ~ ~3.25 ~ run function arena_boss:type_specific/blaze_king/animation/blazing_pillar/particle_02 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 79 run data modify storage arena_boss:temp SkillParticle.Radius set value 1.4f
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 79 at @e[tag=arena.boss.Extra-09,distance=..64] positioned ~ ~4.0 ~ run function arena_boss:type_specific/blaze_king/animation/blazing_pillar/particle_02 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 80 run data modify storage arena_boss:temp SkillParticle.Radius set value 1.5f
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 80 at @e[tag=arena.boss.Extra-09,distance=..64] positioned ~ ~4.75 ~ run function arena_boss:type_specific/blaze_king/animation/blazing_pillar/particle_02 with storage arena_boss:temp SkillParticle

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 75..80 at @e[tag=arena.boss.Extra-09,distance=..64] run playsound item.firecharge.use master @a ~ ~ ~ 5 0.8
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 75..80 at @e[tag=arena.boss.Extra-09,distance=..64] run playsound entity.firework_rocket.large_blast master @a ~ ~ ~ 5 0.5
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 75..80 at @e[tag=arena.boss.Extra-09,distance=..64] run playsound entity.shulker.shoot master @a ~ ~ ~ 5 0.9

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 75..80 at @e[tag=arena.boss.Extra-09,distance=..64] as @a[tag=arena.boss.Player,distance=..3] run damage @s 15.0 magic at ~ ~ ~

execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 100 run kill @e[tag=arena.boss.Extra-09,distance=..64]
execute if score @p[tag=arena.boss.Core-Player] Arenaboss.Timer matches 100 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"regular"}

