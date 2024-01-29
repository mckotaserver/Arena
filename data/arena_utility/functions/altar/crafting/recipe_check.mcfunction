## レシピ確認
# 確認する対象をコピー
data modify storage arena_utility:temp Altar.Crafting.RecipeChecking set from storage arena_utility:temp Altar.Crafting.Recipes[0].ingredients

    # 強化レシピ → isCoreを削除
    data modify storage arena_utility:temp Altar.Crafting.inherit_core_item set from storage arena_utility:temp Altar.Crafting.Recipes[0].inherit_core_item

    execute if data storage arena_utility:temp {Altar:{Crafting:{inherit_core_item:true}}} run data remove storage arena_utility:temp Altar.Crafting.RecipeChecking[{isCore:true}]

tellraw @a {"nbt":"Altar.Crafting.RecipeChecking","storage":"arena_utility:temp"}
# $say $(PlacedItem)

#> ふたつの要素から一致を判定
# フラグをリセット
data modify storage arena_utility:temp Altar.Crafting.RecipeMatched set value true

tellraw @a {"nbt":"Altar.Crafting.RecipeMatched","storage":"arena_utility:temp"}

# 要素数を取得
execute store result score #Utility.Altar.RecipeElements-1 Arena.Temp run data get storage arena_utility:temp Altar.Crafting.RecipeChecking
execute store result score #Utility.Altar.RecipeElements-2 Arena.Temp run data get storage arena_utility:temp Altar.Crafting.PlacedItem

execute unless score #Utility.Altar.RecipeElements-1 Arena.Temp = #Utility.Altar.RecipeElements-2 Arena.Temp run data modify storage arena_utility:temp Altar.Crafting.RecipeMatched set value false

tellraw @a {"nbt":"Altar.Crafting.RecipeMatched","storage":"arena_utility:temp"}

# List一致を確認 (このとき順不同)
$execute unless data storage arena_utility:temp {Altar:{Crafting:{RecipeChecking:$(PlacedItem)}}} run data modify storage arena_utility:temp Altar.Crafting.RecipeMatched set value false
tellraw @a {"nbt":"Altar.Crafting.RecipeMatched","storage":"arena_utility:temp"}

execute if data storage arena_utility:temp {Altar:{Crafting:{RecipeMatched:true}}} run data modify storage arena_utility:temp Altar.Crafting.Refering set from storage arena_utility:temp Altar.Crafting.Recipes[0]
execute if data storage arena_utility:temp {Altar:{Crafting:{RecipeMatched:true}}} run return 0

# 上記を満たさなければ[0]を削除、再起
data remove storage arena_utility:temp Altar.Crafting.Recipes[0]

# 次再起のデータセット
    # 強化レシピ → isCoreを削除
    data modify storage arena_utility:temp Altar.Crafting.PlacedItem set from storage arena_utility:temp Altar.data.PlacedItem

        # 確認が面倒なdisplayタグは削除
        data remove storage arena_utility:temp Altar.Crafting.PlacedItem[].tag.display

    data modify storage arena_utility:temp Altar.Crafting.inherit_core_item set from storage arena_utility:temp Altar.Crafting.Recipes[0].inherit_core_item

    execute if data storage arena_utility:temp {Altar:{Crafting:{inherit_core_item:true}}} run data remove storage arena_utility:temp Altar.Crafting.PlacedItem[{isCore:true}]

execute if data storage arena_utility:temp Altar.Crafting.Recipes[0] run function arena_utility:altar/crafting/recipe_check with storage arena_utility:temp Altar.Crafting

