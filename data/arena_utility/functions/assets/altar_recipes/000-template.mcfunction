## レシピ登録
# 項の作成
data modify storage arena:assets utility.altar_recipes append value {id:"000-template"}

#> レシピデータ
# Recipe
data modify storage arena:assets utility.altar_recipes[-1].ingredients set value []
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {item:"minecraft:nether_star",Count:1b,tag:{},isCore:true}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:diamond",Count:4b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:redstone",Count:4b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:diamond",Count:4b,tag:{}}

# 成果物
data modify storage arena:assets utility.altar_recipes[-1].product set value {"id":"minecraft:diamond","Count":1b,"tag":{Enchantments:[{}],display:{Name:'{"text":"強化ダイヤ","color":"yellow","italic":false}'}}}

# 材料の順番を気にするかどうか
data modify storage arena:assets utility.altar_recipes[-1].order_restricted set value false

# コアアイテムがタグによって指定されているか
data modify storage arena:assets utility.altar_recipes[-1].tagged_core_item set value false

# コアアイテムのデータを継承するか
data modify storage arena:assets utility.altar_recipes[-1].inherit_core_item set value false

# Lore に影響を与えるかどうか (エンチャント等)
data modify storage arena:assets utility.altar_recipes[-1].lore.affects_lore set value false

    # data modify storage arena:assets utility.altar_recipes[-1].lore.text set value '{"text":"Lore","color":"white","italic":false}'
