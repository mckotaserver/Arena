# 召喚中

# ここからアニメーション
#
scoreboard players add $AnimationTimer ArenaBoss 1

# 演出
execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~3 ~-2 ~
execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~-3 ~-2 ~
execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~ ~-2 ~3
execute if score $AnimationTimer ArenaBoss matches 20 run summon lightning_bolt ~ ~-2 ~-3

execute if score $AnimationTimer ArenaBoss matches 30 run summon lightning_bolt ~3 ~-2 ~3
execute if score $AnimationTimer ArenaBoss matches 30 run summon lightning_bolt ~-3 ~-2 ~3
execute if score $AnimationTimer ArenaBoss matches 30 run summon lightning_bolt ~3 ~-2 ~-3
execute if score $AnimationTimer ArenaBoss matches 30 run summon lightning_bolt ~-3 ~-2 ~-3

execute if score $AnimationTimer ArenaBoss matches 30 run playsound entity.enderman.scream master @a ~ ~ ~ 5 0.75

execute if score $AnimationTimer ArenaBoss matches 30..45 run particle flash ~ ~ ~ 0 0 0 0 3 force



# summon
execute if score $AnimationTimer ArenaBoss matches 60 run function arena-boss:summon/thunder

# リセット
execute if score $AnimationTimer ArenaBoss matches 80 run function arena-boss:animation/reset

# その他
# execute as @e[tag=ArenaBoss.Core,distance=..64] at @s run function arena-boss:animation/thunder/particle/regular

# 動き停止
execute if score $AnimationTimer ArenaBoss matches 1 run data modify storage arena-boss: Animation.Flag.NoMove set value true
