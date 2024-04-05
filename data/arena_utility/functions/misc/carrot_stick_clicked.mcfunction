## 人参棒のクリック
# トリガーのリセット
scoreboard players reset @s arena.carrot_stick_click
advancement revoke @s only arena_utility:misc/carrot_stick_clicked

# データコピー
data modify storage arena_utility:temp misc.item_click.data set value {}
data modify storage arena_utility:temp misc.item_click.data set from entity @s SelectedItem

# 例外処理
execute unless data storage arena_utility:temp misc.item_click.data.tag.CustomModelData run return 0
execute unless data storage arena_utility:temp {misc:{item_click:{data:{id:"minecraft:carrot_on_a_stick"}}}} run return 0

# CustomModelDataの値で処理分岐
execute if data storage arena_utility:temp {misc:{item_click:{data:{tag:{CustomModelData:2000060}}}}} run function arena_utility:misc/enchanted_book_bundle/on_use
execute if data storage arena_utility:temp {misc:{item_click:{data:{tag:{CustomModelData:2000061}}}}} run function arena_utility:misc/enchanted_book_bundle/on_use
execute if data storage arena_utility:temp {misc:{item_click:{data:{tag:{CustomModelData:2000062}}}}} run function arena_utility:misc/enchanted_book_bundle/on_use