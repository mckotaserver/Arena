## Altar クリック左
# トリガー解除
advancement revoke @s only arena_utility:altar/on_click/left

# データのコピー
data modify storage arena-utility:temp Altar.data set from entity @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Altar

#> エラー出力
    # ほかの人が使用中
    execute if data storage arena-utility:temp {Altar:{data:{isUsing:true}}} unless entity @s[tag=Arena.Utility.Altar.User] run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.altar.message.error.someone_using"}]
    execute if data storage arena-utility:temp {Altar:{data:{isUsing:true}}} unless entity @s[tag=Arena.Utility.Altar.User] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena-utility:temp {Altar:{data:{isUsing:true}}} unless entity @s[tag=Arena.Utility.Altar.User] run return -1

    # アイテムおいてない
    execute unless data storage arena-utility:temp Altar.data.PlacedItem[0] run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.altar.message.error.no_extractable_item"}]
    execute unless data storage arena-utility:temp Altar.data.PlacedItem[0] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
    execute unless data storage arena-utility:temp Altar.data.PlacedItem[0] run return -1

    # インベントリいっぱい
    execute store result score #Utility.Altar.InventoryCheck Arena.Temp run data get entity @s Inventory[35].Slot

    execute if score #Utility.Altar.InventoryCheck Arena.Temp matches 35 run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.altar.message.error.full_inventory"}]
    execute if score #Utility.Altar.InventoryCheck Arena.Temp matches 35 run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
    execute if score #Utility.Altar.InventoryCheck Arena.Temp matches 35 run return -1

#> アイテムの取り出し
# Shift 非押下時 → 最後の1つだけ
execute unless predicate arena_utility:flags/is_sneaking run function arena_utility:altar/item_extraction/last

# Shift 押下時 → 最後の1つだけ
execute if predicate arena_utility:flags/is_sneaking run function arena_utility:altar/item_extraction/all

execute if predicate arena_utility:flags/is_sneaking 

# 辻褄合わせ: タグ除去
execute unless data entity @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Altar.PlacedItem[0] run tag @s remove Arena.Utility.Altar.User
execute as @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] unless data entity @s data.Arena.Altar.PlacedItem[0] run data modify entity @s data.Arena.Altar.isUsing set value false

#> 演出
    # 効果音
    execute at @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] run playsound ui.button.click master @a ~ ~ ~ 1 2
    execute at @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] run playsound entity.item.pickup master @a ~ ~ ~ 1 0.75
