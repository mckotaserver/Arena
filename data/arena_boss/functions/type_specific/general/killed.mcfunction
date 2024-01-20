## 討伐判定
# 演出  
    # playsound
    playsound entity.blaze.death master @a ~ ~ ~ 2 0.75
    playsound entity.blaze.death master @a ~ ~ ~ 2 1.5

    playsound entity.generic.explode master @a ~ ~ ~ 2 0.75

    # particle
    particle explosion_emitter ~ ~ ~ 0 0 0 0 2

    particle sculk_soul ~ ~ ~ 0.125 0.125 0.125 0.1 50

    particle flame ~ ~ ~ 0.125 0.125 0.125 0.1 50
    particle small_flame ~ ~ ~ 0.125 0.125 0.125 0.05 50

    particle smoke ~ ~ ~ 0.125 0 0.125 0.1 100
    
#> リセット処理
execute as @e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1] at @s run function arena_boss:misc/stage_reset

