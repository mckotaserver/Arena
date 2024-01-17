## ロビーへのテレポート
# TP
tp @s ~ ~-0.5 ~ ~ ~

#> 演出
    # playsound
    playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 0.5 0.75
    playsound entity.enderman.teleport master @s ~ ~ ~ 1 0.75

    # particle
    particle portal ~ ~ ~ 0.5 0.5 0.5 0.1 20
    particle minecraft:dust_color_transition 100000000 1 100000000 1 0 0 0 ~ ~ ~ 0.25 0.75 0.25 1 20

# motion打ち消し
execute as @p run tp @s @s 

#> Display関連
# リセット
execute as @e[tag=Arena.Boss.Selector.Core] at @s run function arena_boss:core/entrance/stage_selector/reset

