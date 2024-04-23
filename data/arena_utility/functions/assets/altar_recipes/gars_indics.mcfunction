## レシピ登録
# 項の作成
data modify storage arena:assets utility.altar_recipes append value {id:"gars_indics"}

#> レシピデータ
# Recipe
data modify storage arena:assets utility.altar_recipes[-1].ingredients set value []
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:diamond_axe",Count:1b,tag:{Damage:1560},isCore:true}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:firework_star",Count:12b,tag:{CustomModelData:2010001,Enchantments:[{}]}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:firework_star",Count:12b,tag:{CustomModelData:2010001,Enchantments:[{}]}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:firework_star",Count:12b,tag:{CustomModelData:2010001,Enchantments:[{}]}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:wither_skeleton_skull",Count:24b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:wither_skeleton_skull",Count:24b,tag:{}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:dragon_egg",Count:3b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:ancient_debris",Count:32b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:deepslate_diamond_ore",Count:64b,tag:{}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:totem_of_undying",Count:1b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:totem_of_undying",Count:1b,tag:{}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:strong_strength"}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:long_strength"}}


# 成果物
data modify storage arena:assets utility.altar_recipes[-1].product set value {"id":"minecraft:diamond_axe","Count":1b,tag:{display:{Name:'{"text":"ガルスインディクス","color":"light_purple","bold":true,"italic":false}',Lore:['{"text":"星屑のかけらにより作られた重斧","color":"dark_gray","italic":false}']},Enchantments:[{id:"minecraft:sharpness",lvl:7s},{id:"minecraft:smite",lvl:6s},{id:"minecraft:unbreaking",lvl:4s}],Damage:1560,AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:15,Operation:0,UUID:[I;-1501748195,-1901509950,-1496142335,1400959435],Slot:"mainhand"},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:-2.5,Operation:0,UUID:[I;1050857440,1581534798,-2054105306,-1495720357],Slot:"mainhand"}]}}

# 材料の順番を気にするかどうか
data modify storage arena:assets utility.altar_recipes[-1].order_restricted set value false

# コアアイテムがタグによって指定されているか
data modify storage arena:assets utility.altar_recipes[-1].tagged_core_item set value false

# コアアイテムのデータを継承するか
data modify storage arena:assets utility.altar_recipes[-1].inherit_core_item set value false

# Lore に影響を与えるかどうか (エンチャント等)
data modify storage arena:assets utility.altar_recipes[-1].lore.affects_lore set value false

    # data modify storage arena:assets utility.altar_recipes[-1].lore.text set value '{"text":"Lore","color":"white","italic":false}'
