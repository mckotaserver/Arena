## レシピ登録
# 項の作成
data modify storage arena:assets utility.altar_recipes append value {id:"ugou"}

#> レシピデータ
# Recipe
data modify storage arena:assets utility.altar_recipes[-1].ingredients set value []
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:bow",Count:1b,tag:{Damage:383},isCore:true}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:firework_star",Count:8b,tag:{CustomModelData:2010003}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:firework_star",Count:8b,tag:{CustomModelData:2010003}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:firework_star",Count:12b,tag:{CustomModelData:2010001}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:firework_star",Count:12b,tag:{CustomModelData:2010001}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:glow_ink_sac",Count:64b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:disc_fragment_5",Count:4b,tag:{}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:raw_copper_block",Count:64b,tag:{}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:dragon_egg",Count:2b,tag:{}}

# 成果物
data modify storage arena:assets utility.altar_recipes[-1].product set value {"id":"minecraft:bow","Count":1b,tag:{display:{Name:'{"text":"烏号","color":"light_purple","italic":false}'},Enchantments:[{id:"minecraft:power",lvl:7s},{id:"minecraft:infinity",lvl:1s},{id:"minecraft:mending",lvl:1s},{id:"minecraft:unbreaking",lvl:4s}],AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:-0.05,Operation:1,UUID:[I;-1416549046,-508211889,-1569361097,-882803624],Slot:"mainhand"}],arena:{direct_enchanting:{available:"infinite_and_mending",item_type:"tool",tool_type:"bow"}}}}

# 材料の順番を気にするかどうか
data modify storage arena:assets utility.altar_recipes[-1].order_restricted set value false

# コアアイテムがタグによって指定されているか
data modify storage arena:assets utility.altar_recipes[-1].tagged_core_item set value false

# コアアイテムのデータを継承するか
data modify storage arena:assets utility.altar_recipes[-1].inherit_core_item set value false

# Lore に影響を与えるかどうか (エンチャント等)
data modify storage arena:assets utility.altar_recipes[-1].lore.affects_lore set value false

    # data modify storage arena:assets utility.altar_recipes[-1].lore.text set value '{"text":"Lore","color":"white","italic":false}'
