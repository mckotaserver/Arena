## レシピ登録
# 項の作成
data modify storage arena:assets utility.altar_recipes append value {id:"011-bossench_fire-1"}

#> レシピデータ
# Recipe
data modify storage arena:assets utility.altar_recipes[-1].ingredients set value []
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {type:"sword",Count:1b,tag:{Arena:{Upgrade:{BossEnchantments:false}}},isCore:true}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:cobblestone",Count:64b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:cobblestone",Count:64b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:cobblestone",Count:64b,tag:{}}
    data modify storage arena:assets utility.altar_recipes[-1].ingredients append value {id:"minecraft:diamond",Count:24b,tag:{}}

# 成果物
data modify storage arena:assets utility.altar_recipes[-1].product set value {tag:{Arena:{Upgrade:{test:true}}},Enchantments:[{}]}

# 材料の順番を気にするかどうか
data modify storage arena:assets utility.altar_recipes[-1].order_restricted set value false

# 強化レシピであるかどうか (= Core Item のデータを引き継ぐかどうか)
data modify storage arena:assets utility.altar_recipes[-1].upgrade_recipe set value true

# Lore に影響を与えるかどうか (エンチャント等)
data modify storage arena:assets utility.altar_recipes[-1].lore.affects_lore set value true

    data modify storage arena:assets utility.altar_recipes[-1].lore.text set value ['{"text":"Test Upgrade","color":"white","italic":false}','{"text":"This is an upgrade text.","color":"gray","italic":false}']
