# 召喚中

# ここからアニメーション
#
scoreboard players add $AnimationTimer ArenaBoss 1

# 演出
execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~3 ~ ~
execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~-3 ~ ~
execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~ ~ ~3
execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~ ~ ~-3

execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~3 ~ ~
execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~-3 ~ ~
execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~ ~ ~3
execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~ ~ ~-3


