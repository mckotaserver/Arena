# 召喚中

# ここからアニメーション
#
scoreboard players add $AnimationTimer ArenaBoss 1

# 回転
execute if score $AnimationTimer ArenaBoss matches 61..80 run function arena-boss:animation/fire/body_spin/fastest
execute if score $AnimationTimer ArenaBoss matches 81..100 run function arena-boss:animation/fire/body_spin/fast

# 演出
execute if score $AnimationTimer ArenaBoss matches 1..260 at @e[tag=ArenaBoss.EscapeTo,distance=..64] run particle minecraft:large_smoke ~ ~0.5 ~ 0 1 0 0.125 0

execute if score $AnimationTimer ArenaBoss matches 1..40 at @e[tag=ArenaBoss.EscapeTo,distance=..64] if predicate arena:1-n/10 run playsound block.fire.extinguish master @a ~ ~ ~ 3 0.77 
execute if score $AnimationTimer ArenaBoss matches 1..40 at @e[tag=ArenaBoss.EscapeTo,distance=..64] if predicate arena:1-n/06 run playsound block.stone.break master @a ~ ~ ~ 5 0.66


execute if score $AnimationTimer ArenaBoss matches 30 at @e[tag=ArenaBoss.StageCore,sort=nearest,limit=1] rotated 0 0 positioned ^ ^ ^15 run summon marker ~ ~-0.8 ~ {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-0"]}
execute if score $AnimationTimer ArenaBoss matches 30 at @e[tag=ArenaBoss.StageCore,sort=nearest,limit=1] rotated 56 0 positioned ^ ^ ^13 run summon marker ~ ~-1.1 ~ {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-0"]}
execute if score $AnimationTimer ArenaBoss matches 30 at @e[tag=ArenaBoss.StageCore,sort=nearest,limit=1] rotated 109 0 positioned ^ ^ ^12 run summon marker ~ ~-0.9 ~ {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-0"]}

execute if score $AnimationTimer ArenaBoss matches 30 at @e[tag=ArenaBoss.StageCore,sort=nearest,limit=1] rotated 178 0 positioned ^ ^ ^16 run summon marker ~ ~-0.75 ~ {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-0"]}
execute if score $AnimationTimer ArenaBoss matches 30 at @e[tag=ArenaBoss.StageCore,sort=nearest,limit=1] rotated 229 0 positioned ^ ^ ^18 run summon marker ~ ~-1.2 ~ {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-0"]}
execute if score $AnimationTimer ArenaBoss matches 30 at @e[tag=ArenaBoss.StageCore,sort=nearest,limit=1] rotated 307 0 positioned ^ ^ ^14 run summon marker ~ ~-1 ~ {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-0"]}

execute if score $AnimationTimer ArenaBoss matches 30..80 as @e[tag=ArenaBoss.SkillMarker-0,distance=..64] at @s run tp @s ~ ~0.075 ~
execute if score $AnimationTimer ArenaBoss matches 30..300 at @e[tag=ArenaBoss.SkillMarker-0,distance=..64] run particle dust_color_transition 1 0 0 2.5 0 0 0 ~ ~ ~ 0.25 0.25 0.25 1 4

execute if score $AnimationTimer ArenaBoss matches 30..80 as @e[tag=ArenaBoss.SkillMarker-0,distance=..64] at @s if predicate arena:1-n/10 run playsound entity.blaze.burn master @a ~ ~ ~ 4 0.75

execute if score $AnimationTimer ArenaBoss matches 80 at @e[tag=ArenaBoss.StageCore,sort=nearest,limit=1] run summon item_display ~ ~5 ~ {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-1"],item:{id:"minecraft:orange_dye",Count:1b,tag:{CustomModelData:490102}},item_display:head}

execute if score $AnimationTimer ArenaBoss matches 81..300 as @e[tag=ArenaBoss.SkillMarker-0,distance=..64] at @s facing entity @e[tag=ArenaBoss.SkillMarker-1] eyes run function arena-boss:animation/fire/particle/laser


execute if score $AnimationTimer ArenaBoss matches 90 at @e[tag=ArenaBoss.StageCore,sort=nearest,limit=1] run summon marker ~ ~ ~ {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-2-0","ArenaBoss.SkillMarker-2"]}
execute if score $AnimationTimer ArenaBoss matches 90 at @e[tag=ArenaBoss.StageCore,sort=nearest,limit=1] run summon marker ~ ~ ~ {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-2-1","ArenaBoss.SkillMarker-2"]}

execute if score $AnimationTimer ArenaBoss matches 90..300 at @e[tag=ArenaBoss.SkillMarker-2-0,sort=nearest,limit=1] run function arena-boss:animation/fire/particle/spawning/magic-0
execute if score $AnimationTimer ArenaBoss matches 105..300 at @e[tag=ArenaBoss.SkillMarker-2-0,sort=nearest,limit=1] run function arena-boss:animation/fire/particle/spawning/magic-1
execute if score $AnimationTimer ArenaBoss matches 110..300 at @e[tag=ArenaBoss.SkillMarker-2-0,sort=nearest,limit=1] run function arena-boss:animation/fire/particle/spawning/magic-2
execute if score $AnimationTimer ArenaBoss matches 130..300 at @e[tag=ArenaBoss.SkillMarker-2-0,sort=nearest,limit=1] run function arena-boss:animation/fire/particle/spawning/magic-3

execute if score $AnimationTimer ArenaBoss matches 140..300 at @e[tag=ArenaBoss.SkillMarker-2-0,sort=nearest,limit=1] run function arena-boss:animation/fire/particle/spawning/magic-4
execute if score $AnimationTimer ArenaBoss matches 160..300 at @e[tag=ArenaBoss.SkillMarker-2-0,sort=nearest,limit=1] run function arena-boss:animation/fire/particle/spawning/magic-5

execute if score $AnimationTimer ArenaBoss matches 140..300 as @e[tag=ArenaBoss.SkillMarker-2-0,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ ~0.1 ~
execute if score $AnimationTimer ArenaBoss matches 140..300 as @e[tag=ArenaBoss.SkillMarker-2-1,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ ~-0.1 ~

execute if score $AnimationTimer ArenaBoss matches 201 run playsound block.lava.extinguish master @a ~ ~ ~ 5 1.7
execute if score $AnimationTimer ArenaBoss matches 201 run playsound block.lava.extinguish master @a ~ ~ ~ 5 0.75

execute if score $AnimationTimer ArenaBoss matches 201 run playsound block.lava.ambient master @a ~ ~ ~ 5 0.85

execute if score $AnimationTimer ArenaBoss matches 220 run playsound entity.generic.explode master @a ~ ~ ~ 5 1.65
execute if score $AnimationTimer ArenaBoss matches 220 run playsound entity.blaze.shoot master @a ~ ~ ~ 5 0.66

execute if score $AnimationTimer ArenaBoss matches 220 run particle lava ~ ~ ~ 0 0 0 1 100
execute if score $AnimationTimer ArenaBoss matches 220 run particle crimson_spore ~ ~ ~ 1 1 1 1 100

execute if score $AnimationTimer ArenaBoss matches 220 run summon marker ~3 ~3 ~3 {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-3"]}
execute if score $AnimationTimer ArenaBoss matches 220 run summon marker ~-3 ~3 ~3 {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-3"]}
execute if score $AnimationTimer ArenaBoss matches 220 run summon marker ~3 ~3 ~-3 {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-3"]}
execute if score $AnimationTimer ArenaBoss matches 220 run summon marker ~-3 ~3 ~-3 {Tags:["ArenaBoss.SkillMarker","ArenaBoss.SkillMarker-3"]}

execute if score $AnimationTimer ArenaBoss matches 221..260 at @e[tag=ArenaBoss.SkillMarker-3,distance=..64] run particle flame ~ ~ ~ ^ ^ ^1000000000 0.0000000005 0
execute if score $AnimationTimer ArenaBoss matches 221..260 at @e[tag=ArenaBoss.SkillMarker-3,distance=..64] run particle soul_fire_flame ~ ~ ~ ^0.5 ^ ^1000000000 0.0000000002 0

execute if score $AnimationTimer ArenaBoss matches 221..260 at @e[tag=ArenaBoss.SkillMarker-3,distance=..64] run particle dripping_lava ~ ~ ~ 0 0 0 0 2
execute if score $AnimationTimer ArenaBoss matches 221..260 at @e[tag=ArenaBoss.SkillMarker-3,distance=..64] run particle lava ~ ~ ~ 0 0 0 1 1

execute if score $AnimationTimer ArenaBoss matches 221..260 as @e[tag=ArenaBoss.SkillMarker-3,distance=..64] at @s run tp @s ^0.25 ^ ^0.125 facing entity @e[tag=ArenaBoss.StageCore,sort=nearest,limit=1] feet

execute if score $AnimationTimer ArenaBoss matches 221..230 run playsound block.lava.extinguish master @a ~ ~ ~ 5 0.5

execute if score $AnimationTimer ArenaBoss matches 225 run playsound item.trident.thunder master @a ~ ~ ~ 5 0.5

execute if score $AnimationTimer ArenaBoss matches 240 run playsound block.conduit.activate master @a ~ ~ ~ 5 0.5
execute if score $AnimationTimer ArenaBoss matches 240 run playsound entity.wither.spawn master @a ~ ~ ~ 5 0.67

execute if score $AnimationTimer ArenaBoss matches 260 run playsound entity.blaze.death master @a ~ ~ ~ 5 0.66
execute if score $AnimationTimer ArenaBoss matches 260 run playsound entity.blaze.death master @a ~ ~ ~ 5 0.8

execute if score $AnimationTimer ArenaBoss matches 260 run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 0.5


execute if score $AnimationTimer ArenaBoss matches 260 run kill @e[tag=ArenaBoss.SkillMarker]

# summon
execute if score $AnimationTimer ArenaBoss matches 260 run function arena-boss:summon/fire

# リセット
execute if score $AnimationTimer ArenaBoss matches 260 run function arena-boss:animation/reset

# その他
execute as @e[tag=ArenaBoss.Core,distance=..64] at @s run function arena-boss:animation/fire/particle/regular

# 動き停止
execute if score $AnimationTimer ArenaBoss matches 1 run data modify storage arena-boss: Animation.Flag.NoMove set value true
