particle enchanted_hit ~ ~ ~ 0 0 0 0 1

execute as @a[tag=Arena.Boss.Player,dx=0] positioned ~-0.98 ~-0.98 ~-0.99 as @s[dx=0] run damage @s 5 magic
execute if entity @e[tag=Arena.Boss.Main.Core,distance=..12] positioned ^ ^ ^0.5 run function arena_boss:type_specific/blaze_king/animation/radiative/laser
