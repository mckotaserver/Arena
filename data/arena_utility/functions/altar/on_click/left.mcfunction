## Altar クリック左
# トリガー解除
advancement revoke @s only arena_utility:altar/on_click/left

# データのコピー
data modify storage arena_utility:temp Altar.data set from entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.arena.Altar

#> エラー出力
    # クラフト中 (警告はなし)
    execute if data storage arena_utility:temp {Altar:{data:{isCrafting:true}}} run return 0
    execute if data entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] {data:{arena:{Scheduling:"arena_utility:altar/crafting/animation/product_give"}}} run return 0

    # ほかの人が使用中
    execute if data storage arena_utility:temp {Altar:{data:{isUsing:true}}} unless entity @s[tag=arena.Utility.Altar.User] run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.altar.message.error.someone_using"}]
    execute if data storage arena_utility:temp {Altar:{data:{isUsing:true}}} unless entity @s[tag=arena.Utility.Altar.User] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_utility:temp {Altar:{data:{isUsing:true}}} unless entity @s[tag=arena.Utility.Altar.User] run return 0

    # アイテムおいてない
    execute unless data storage arena_utility:temp Altar.data.PlacedItem[0] run return 0

    # インベントリいっぱい
    execute store result score #Utility.Altar.InventoryCheck arena.temp run data get entity @s Inventory[35].Slot

    execute if score #Utility.Altar.InventoryCheck arena.temp matches 35 run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.altar.message.error.full_inventory"}]
    execute if score #Utility.Altar.InventoryCheck arena.temp matches 35 run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
    execute if score #Utility.Altar.InventoryCheck arena.temp matches 35 run return 0

#> アイテムの取り出し
# Shift 非押下時 → 最後の1つだけ
execute unless predicate arena_utility:flags/is_sneaking run function arena_utility:altar/item_extraction/last

# Shift 押下時 → 全部
execute if predicate arena_utility:flags/is_sneaking run function arena_utility:altar/item_extraction/all

# 辻褄合わせ: タグ除去
execute unless data entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.arena.Altar.PlacedItem[0] run tag @s remove arena.Utility.Altar.User
execute as @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] unless data entity @s data.arena.Altar.PlacedItem[0] run data modify entity @s data.arena.Altar.isUsing set value false

#> 演出
    # 効果音
    execute at @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] run playsound ui.button.click master @a ~ ~ ~ 1 2
    execute at @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] run playsound entity.item.pickup master @a ~ ~ ~ 1 0.75
