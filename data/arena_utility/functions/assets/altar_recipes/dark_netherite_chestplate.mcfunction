## レシピ登録
# 項の作成
data modify storage arena:assets utility.altar_recipes append value {id:"dark_netherite_chestplate"}

#> レシピデータ
# Recipe
data modify storage arena:assets utility.altar_recipes[-1].ingredients set value []
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:netherite_chestplate",Count:1b,tag:{Damage:0},isCore:true}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:firework_star",Count:3b,tag:{CustomModelData:2010001}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:firework_star",Count:3b,tag:{CustomModelData:2010001}}

    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:wither_skeleton_skull",Count:8b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:wither_skeleton_skull",Count:8b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:netherite_ingot",Count:4b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:obsidian",Count:64b,tag:{}}
    
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:deepslate_coal_ore",Count:32b,tag:{}}

# 成果物
data modify storage arena:assets utility.altar_recipes[-1].product set value {"id":"minecraft:netherite_chestplate","Count":1b,tag:{display:{Name:'{"text":"ダークネザライトチェストプレート","color":"light_purple","italic":false}'},Trim:{material:"dark_netherite",pattern:"dark_netherite"},HideFlags:128,AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:3,Operation:0,UUID:[I;-446250635,188367748,-1915136231,-198903933],Slot:"chest"},{AttributeName:"generic.armor",Name:"generic.armor",Amount:10,Operation:0,UUID:[I;1891565615,-167620638,-1739405413,-1862874108],Slot:"chest"},{AttributeName:"generic.armor_toughness",Name:"generic.armor_toughness",Amount:4,Operation:0,UUID:[I;-1697251949,-2010624518,-1344566994,-739122617],Slot:"chest"},{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:0.12,Operation:0,UUID:[I;58336053,-458208459,-1575270292,-2021962898],Slot:"chest"}]}}

# 材料の順番を気にするかどうか
data modify storage arena:assets utility.altar_recipes[-1].order_restricted set value false

# コアアイテムがタグによって指定されているか
data modify storage arena:assets utility.altar_recipes[-1].tagged_core_item set value false

# コアアイテムのデータを継承するか
data modify storage arena:assets utility.altar_recipes[-1].inherit_core_item set value false

# Lore に影響を与えるかどうか (エンチャント等)
data modify storage arena:assets utility.altar_recipes[-1].lore.affects_lore set value false

    # data modify storage arena:assets utility.altar_recipes[-1].lore.text set value '{"text":"Lore","color":"white","italic":false}'
