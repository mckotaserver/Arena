## 継承レシピ
# アイテム種類の指定方法から分岐
    # tag指定
    execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{tagged_core_item:true}}}} run data modify storage arena_utility:temp Altar.Crafting.core_checking.succeeded set value false
    $execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{tagged_core_item:true}}}} run data modify storage arena_utility:temp Altar.Crafting.core_checking.list set from storage arena:assets utility.item_tag[{id:"$(item)"}].value
        
    execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{tagged_core_item:true}}}} run function arena_utility:altar/crafting/inherit_core_item/tag_checking with storage arena_utility:temp Altar.Crafting.core_checking

    # id指定
    execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{tagged_core_item:false}}}} run data modify storage arena_utility:temp Altar.Crafting.core_checking.item set from storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}].id
    execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{tagged_core_item:false}}}} run data modify storage arena_utility:temp Altar.Crafting.core_checking.succeeded set value false
    
    execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{tagged_core_item:false}}}} store success storage arena_utility:temp Altar.Crafting.core_checking.compare_result byte 1 run data modify storage arena_utility:temp Altar.Crafting.core_checking.item set from storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}].id

    execute if data storage arena_utility:temp {Altar:{Crafting:{core_checking:{compare_result:0b}}}} run data modify storage arena_utility:temp Altar.Crafting.core_checking.succeeded set value true

# 判定失敗なら
data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.Available set from storage arena_utility:temp Altar.Crafting.core_checking.succeeded
