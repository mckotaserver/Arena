#> arena_dungeons:combat/player/click_detection/tick
#
execute if predicate arena_dungeons:player/mainhand_item/trigger_click anchored eyes positioned ^ ^ ^ unless entity @e[tag=arena.dungeons.misc.interaction,distance=..0.25] run function arena_dungeons:combat/player/click_detection/update

execute anchored eyes positioned ^ ^ ^ as @e[tag=arena.dungeons.misc.interaction,distance=..4] at @s positioned ~ ~-1.2 ~ unless entity @a[tag=arena.dungeons.player,distance=..0.5] run kill @s
