## レシピ登録
# 項の作成
data modify storage arena:assets utility.altar_recipes append value {id:"dragon_tear"}

#> レシピデータ
# Recipe
data modify storage arena:assets utility.altar_recipes[-1].ingredients set value []
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:heart_of_the_sea",Count:1b,isCore:true,tag:{}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:prismarine_crystals",Count:64b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:prismarine_crystals",Count:64b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:phantom_membrane",Count:16b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:ghast_tear",Count:16b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:ghast_tear",Count:16b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:ender_eye",Count:16b,tag:{}}

# 成果物
data modify storage arena:assets utility.altar_recipes[-1].product set value {id:"minecraft:firework_star",Count:1b,tag:{display:{Name:'{"text":"龍の涙","color":"dark_purple","italic":false}'},CustomModelData:2010003}}

# 材料の順番を気にするかどうか
data modify storage arena:assets utility.altar_recipes[-1].order_restricted set value false

# コアアイテムがタグによって指定されているか
data modify storage arena:assets utility.altar_recipes[-1].tagged_core_item set value false

# コアアイテムのデータを継承するか
data modify storage arena:assets utility.altar_recipes[-1].inherit_core_item set value false

# Lore に影響を与えるかどうか (エンチャント等)
data modify storage arena:assets utility.altar_recipes[-1].lore.affects_lore set value false

    # data modify storage arena:assets utility.altar_recipes[-1].lore.text set value ['{"text":"Test Upgrade","color":"white","italic":false}','{"text":"This is an upgrade text.","color":"gray","italic":false}']
