## 
$particle $(Particle) ^ ^ ^$(Radius) ^ ^ ^$(MotionRadius) $(Speed) 0
# $particle dripping_lava ^ ^ ^$(Radius) 0 0 0 0 1 

scoreboard players add #ParticleLimiter Arena.Temp 8

execute if data storage arena_boss:temp {SkillParticle:{Limiter:true}} run data modify storage arena_boss:temp SkillParticle.Limiter set value false
execute if score #ParticleLimiter Arena.Temp matches 360.. run data modify storage arena_boss:temp SkillParticle.Limiter set value true

execute if data storage arena_boss:temp {SkillParticle:{Limiter:true}} run scoreboard players set #ParticleLimiter Arena.Temp 0
execute if data storage arena_boss:temp {SkillParticle:{Limiter:true}} run return 0

execute rotated ~8 ~ run function arena_boss:type_specific/blaze_king/animation/spawn/particle_5 with storage arena_boss:temp SkillParticle

