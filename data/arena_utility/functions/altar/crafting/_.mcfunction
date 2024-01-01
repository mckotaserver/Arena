## Altar crafting
#> 登録されたレシピに該当するか確認
# レシピデータをコピー
data modify storage arena_utility:temp Altar.Crafting.Recipes set from storage arena:assets utility.altar_recipes

# それぞれのレシピに該当するかどうかひとつずつ確認
data modify storage arena_utility:temp Altar.Crafting.Refering set value {}
data modify storage arena_utility:temp Altar.Crafting.PlacedItem set from storage arena_utility:temp Altar.data.PlacedItem

function arena_utility:altar/crafting/recipe_check with storage arena_utility:temp Altar.Crafting

#> クラフト可能状態か判定
    # 合致するレシピが見つからない
    execute if data storage arena_utility:temp {Altar:{Crafting:{RecipeMatched:false}}} run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.altar.message.error.invalid_recipe"}]
    execute if data storage arena_utility:temp {Altar:{Crafting:{RecipeMatched:false}}} run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_utility:temp {Altar:{Crafting:{RecipeMatched:false}}} run return -1

    # 強化レシピ → 独自判定
    execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{upgrade_recipe:true}}}} run function arena_utility:altar/crafting/upgrade_recipe/checking
    execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{upgrade_recipe:false}}}} run data modify storage arena_utility:temp Altar.Crafting.UpgradeRecipe.Available set value true 

    execute if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Available:false}}}} run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.altar.message.error.invalid_recipe"}]
    execute if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Available:false}}}} run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_utility:temp {Altar:{Crafting:{UpgradeRecipe:{Available:false}}}} run return -1

    # 必要な場合 → 順番まで正しいか判定
    data modify storage arena_utility:temp Altar.Crafting.RecipeChecking set from storage arena_utility:temp Altar.Crafting.Refering.ingredients
    execute store success storage arena_utility:temp Altar.Crafting.WrongOrder byte 1 run data modify storage arena_utility:temp Altar.Crafting.Refering.ingredients set from storage arena_utility:temp Altar.data.PlacedItem

    execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{order_restricted:false}}}} run data modify storage arena_utility:temp Altar.Crafting.WrongOrder set value false

    execute if data storage arena_utility:temp {Altar:{Crafting:{WrongOrder:true}}} run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.altar.message.error.recipe_wrong_order"}]
    execute if data storage arena_utility:temp {Altar:{Crafting:{WrongOrder:true}}} run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_utility:temp {Altar:{Crafting:{WrongOrder:true}}} run return -1


#> クラフト処理
# アニメーション
execute as @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] at @s run function arena_utility:altar/crafting/animation/start

