#> arena_dungeons:rewarding/chest/on_left_click
# トリガー解除
advancement revoke @s only arena_dungeons:misc/chest_click/left

# 効果音
playsound block.wood.hit master @s ~ ~ ~ 1 1

# クリック先を取得
execute anchored eyes positioned ^ ^ ^ run function arena_dungeons:rewarding/chest/raytrace
execute at @e[tag=arena.temp.dungeon_chest_clicked,limit=1] run data modify storage arena_dungeons:temp treasure_chest set from entity @e[tag=arena.dungeons.misc.treasure_chest_marker,sort=nearest,limit=1] data.arena.dungeons.treasure_chest

tag @e[tag=arena.temp.dungeon_chest_clicked,limit=1] remove arena.temp.dungeon_chest_clicked

