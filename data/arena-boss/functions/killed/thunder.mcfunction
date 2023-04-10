# 撃破時
# 演出
playsound entity.enderman.death master @a ~ ~ ~ 2 0.88
playsound minecraft:entity.ender_dragon.death master @a ~ ~ ~ 2 0.9

playsound entity.generic.explode master @a ~ ~ ~ 2 0.5

particle explosion_emitter ~ ~ ~ 0 0 0 0 2


particle portal ~ ~ ~ 2 2 2 0 200
particle minecraft:dust_color_transition 1 0 1 2 0 0 0 ~ ~ ~ 3 3 3 2 150

particle minecraft:witch ~ ~ ~ 0.5 0.25 0.5 0.5 150

# 色々kill
tp @e[tag=ArenaBoss.Element] ~ ~-300 ~
kill @e[tag=ArenaBoss.Element]

tp @e[tag=ArenaBoss.SkillMarker] ~ ~-300 ~
kill @e[tag=ArenaBoss.SkillMarker]

tp @e[tag=ArenaBoss.Minion] ~ ~-300 ~
kill @e[tag=ArenaBoss.Minion]

scoreboard players set $AnimationTimer ArenaBoss 0
