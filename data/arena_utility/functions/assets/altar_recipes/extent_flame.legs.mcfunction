## レシピ登録
# 項の作成
data modify storage arena:assets utility.altar_recipes append value {id:"extent_flame.legs"}

#> レシピデータ
# Recipe
data modify storage arena:assets utility.altar_recipes[-1].ingredients set value []
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:netherite_leggings",Count:1b,tag:{Damage:0},isCore:true}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:firework_star",Count:4b,tag:{CustomModelData:2010000}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:firework_star",Count:4b,tag:{CustomModelData:2010000}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:blaze_rod",Count:16b,tag:{arena:{id:"material_blaze_rod"}}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:raw_iron_block",Count:64b,tag:{}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:wither_skeleton_skull",Count:12b,tag:{}}
    
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:deepslate_coal_ore",Count:32b,tag:{}}

# 成果物
data modify storage arena:assets utility.altar_recipes[-1].product set value {"id":"minecraft:diamond_leggings","Count":1b,tag:{display:{Name:'{"text":"エクステントフレイム","color":"yellow","italic":false}'},Enchantments:[{id:"minecraft:protection",lvl:5s},{id:"minecraft:fire_protection",lvl:4s}]}}

# 材料の順番を気にするかどうか
data modify storage arena:assets utility.altar_recipes[-1].order_restricted set value false

# コアアイテムがタグによって指定されているか
data modify storage arena:assets utility.altar_recipes[-1].tagged_core_item set value false

# コアアイテムのデータを継承するか
data modify storage arena:assets utility.altar_recipes[-1].inherit_core_item set value false

# Lore に影響を与えるかどうか (エンチャント等)
data modify storage arena:assets utility.altar_recipes[-1].lore.affects_lore set value false

    # data modify storage arena:assets utility.altar_recipes[-1].lore.text set value '{"text":"Lore","color":"white","italic":false}'
