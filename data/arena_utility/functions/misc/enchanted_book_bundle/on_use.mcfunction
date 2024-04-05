## エンチャント本バンドル 使用
# loot spawn
execute if data storage arena_utility:temp {misc:{item_click:{data:{tag:{CustomModelData:2000060}}}}} run loot spawn ~ ~ ~ loot arena_utility:misc/enchanted_book_bundle/tier_1
execute if data storage arena_utility:temp {misc:{item_click:{data:{tag:{CustomModelData:2000061}}}}} run loot spawn ~ ~ ~ loot arena_utility:misc/enchanted_book_bundle/tier_2
execute if data storage arena_utility:temp {misc:{item_click:{data:{tag:{CustomModelData:2000062}}}}} run loot spawn ~ ~ ~ loot arena_utility:misc/enchanted_book_bundle/tier_3

# 演出
    # playsound
    playsound minecraft:entity.chicken.ambient master @s ~ ~ ~ 1 1.5
    playsound entity.player.levelup master @s ~ ~ ~ 1 2
    playsound block.anvil.use master @s ~ ~ ~ 1 2

    # particle 
    particle composter ~ ~1 ~ 0.5 0.5 0.5 0.5 10
    particle totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.5 15

# clear
item replace entity @s weapon.mainhand with air
