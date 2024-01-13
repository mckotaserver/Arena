## 強化レシピ: 成果物のデータ作成
# データのマージ
data modify entity @s data.Arena.Altar.Product set from storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}]
data modify entity @s data.Arena.Altar.Product merge from storage arena_utility:temp Altar.Crafting.Refering.product

# Loreに影響する場合 → 
execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{lore:{affects_lore:false}}}}} run return 0

data modify entity @s data.Arena.Altar.Product.tag.display.Lore prepend from storage arena_utility:temp Altar.Crafting.Refering.lore.text[]
