#> arena_dungeons:rewarding/chest/on_right_click
# トリガー解除
advancement revoke @s only arena_dungeons:misc/chest_click/right

# クリック先を取得
execute anchored eyes positioned ^ ^ ^ run function arena_dungeons:rewarding/chest/raytrace
data modify storage arena_dungeons:temp treasure_chest set from entity @e[tag=arena.temp.dungeon_chest_clicked,limit=1] data.arena.dungeons.treasure_chest

# 開封済みか検知
execute if data storage arena_dungeons:temp {treasure_chest:{is_opened:true}} run playsound ui.button.click master @s ~ ~ ~ 1 1.5
execute if data storage arena_dungeons:temp {treasure_chest:{is_opened:true}} run tag @e[tag=arena.temp.dungeon_chest_clicked,limit=1] remove arena.temp.dungeon_chest_clicked

execute if data storage arena_dungeons:temp {treasure_chest:{is_opened:true}} run return 0

# 未開封 → 開封アニメーション & contents解放
execute at @e[tag=arena.temp.dungeon_chest_clicked,limit=1] as @e[tag=arena.dungeons.animated_java.treasure_chest,sort=nearest,limit=1] run function animated_java:treasure_chest/animations/on_open/play

data modify entity @e[tag=arena.temp.dungeon_chest_clicked,limit=1] data.arena.dungeons.treasure_chest.is_opened set value true

data modify storage arena_dungeons:temp reward_tellraw.in set from storage arena_dungeons:temp treasure_chest.contents

function arena_dungeons:rewarding/tellraw

summon item ~ 512 ~ {Item:{id:"minecraft:stone",Count:1b,tag:{}}}
execute positioned ~ 512 ~ run data modify entity @e[type=item,sort=nearest,limit=1] Item set from storage arena_dungeons:temp treasure_chest.contents 

execute positioned ~ 512 ~ run tp @e[type=item,sort=nearest,limit=1] @s


# 効果音
playsound block.chest.open master @s ~ ~ ~ 1 1

execute if data storage arena_dungeons:temp {treasure_chest:{rarity:"normal"}} run playsound block.note_block.pling master @s ~ ~ ~ 1 2

execute if data storage arena_dungeons:temp {treasure_chest:{rarity:"rare"}} run playsound block.note_block.pling master @s ~ ~ ~ 1 2
execute if data storage arena_dungeons:temp {treasure_chest:{rarity:"rare"}} run playsound entity.cat.ambient master @s ~ ~ ~ 1 1

execute if data storage arena_dungeons:temp {treasure_chest:{rarity:"epic"}} run playsound block.note_block.pling master @s ~ ~ ~ 1 2
execute if data storage arena_dungeons:temp {treasure_chest:{rarity:"epic"}} run playsound entity.iron_golem.death master @s ~ ~ ~ 1 1
execute if data storage arena_dungeons:temp {treasure_chest:{rarity:"epic"}} run playsound entity.illusioner.mirror_move master @s ~ ~ ~ 1 0.75

execute if data storage arena_dungeons:temp {treasure_chest:{rarity:"mid_stage"}} run playsound block.smithing_table.use master @s ~ ~ ~
execute if data storage arena_dungeons:temp {treasure_chest:{rarity:"mid_stage"}} run playsound entity.evoker.prepare_summon master @s ~ ~ ~ 1 1
execute if data storage arena_dungeons:temp {treasure_chest:{rarity:"mid_stage"}} run playsound block.note_block.pling master @s ~ ~ ~ 1 2


tag @e[tag=arena.temp.dungeon_chest_clicked,limit=1] remove arena.temp.dungeon_chest_clicked