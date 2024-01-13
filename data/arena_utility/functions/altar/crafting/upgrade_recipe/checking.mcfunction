## 強化レシピ → 独自判定
# アイテムのidをみる
    # データの取得
    data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.ItemTag set from storage arena_utility:temp Altar.Crafting.Refering.ingredients[{isCore:true}].item_tag
    data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.Placed set from storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}].id

    data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.Available set value false

summon armor_stand ~ -64 ~ {Tags:["Arena.Utility.Altar."]}



    execute if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Type:"sword"}}}} if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Placed:"minecraft:wooden_sword"}}}} run data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.Available set value true 
    execute if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Type:"sword"}}}} if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Placed:"minecraft:stone_sword"}}}} run data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.Available set value true 
    execute if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Type:"sword"}}}} if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Placed:"minecraft:iron_sword"}}}} run data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.Available set value true 
    execute if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Type:"sword"}}}} if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Placed:"minecraft:golden_sword"}}}} run data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.Available set value true 
    execute if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Type:"sword"}}}} if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Placed:"minecraft:diamond_sword"}}}} run data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.Available set value true 
    execute if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Type:"sword"}}}} if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Placed:"minecraft:netherite_sword"}}}} run data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.Available set value true 

    execute if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Available:false}}}} run return 0

# フラグ設定
data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.RequiredTag set from storage arena_utility:temp Altar.Crafting.Refering.ingredients[{isCore:true}].tag
data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.PlacedTag set from storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}].tag

execute if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{RequiredTag:{Arena:{Upgrade:{test:false}}}}}}} if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{PlacedTag:{Arena:{Upgrade:{test:true}}}}}}} run data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.Available set value false

