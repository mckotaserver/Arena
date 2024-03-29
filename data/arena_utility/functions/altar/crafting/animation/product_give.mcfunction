## クラフトアニメーション 終了
#> Give
    # コンテナデータを作成
    data modify storage arena_utility:temp data.arena.Altar.ProductGive set from entity @s data.arena.Altar.Product
    data modify storage arena_utility:temp data.arena.Altar.ProductGive.Slot set value 0b

    # 一時コンテナ設置, 中身いじる
    setblock ~ -64 ~ shulker_box replace
    data modify block ~ -64 ~ Items append from storage arena_utility:temp data.arena.Altar.ProductGive

    # インベントリいっぱいか判定
    data modify storage arena_utility:temp data.arena.Altar.UserInvSlot set from entity @p[tag=arena.Utility.Altar.User] Inventory[35].Slot

    execute if data storage arena_utility:temp {data:{arena:{Altar:{UserInvSlot:35b}}}} run data modify storage arena_utility:temp data.arena.Altar.UserInvAvailable set value false
    execute unless data storage arena_utility:temp {data:{arena:{Altar:{UserInvSlot:35b}}}} run data modify storage arena_utility:temp data.arena.Altar.UserInvAvailable set value true

    # 適切な方法でGive
    execute if data storage arena_utility:temp {data:{arena:{Altar:{UserInvAvailable:true}}}} run loot give @p[tag=arena.Utility.Altar.User] mine ~ -64 ~ debug_stick
    execute if data storage arena_utility:temp {data:{arena:{Altar:{UserInvAvailable:false}}}} at @p[tag=arena.Utility.Altar.User] run summon item ~ ~ ~ {Tags:["arena.Utility.Altar.ProductItem"],Item:{id:"minecraft:stone",Count:1b,tag:{}},PickupDelay:0}

    data modify entity @e[tag=arena.Utility.Altar.ProductItem,limit=1] Item set from entity @s data.arena.Altar.Product

#> 後処理
    # プレイヤーのタグ
    tag @p[tag=arena.Utility.Altar.User] remove arena.Utility.Altar.User

    # 
    setblock ~ -64 ~ bedrock

    # 配置済みアイテムの削除
    data modify entity @s data.arena.Altar.PlacedItem set value []

    # 使用中データ
    data modify entity @s data.arena.Altar.isCrafting set value false
    data modify entity @s data.arena.Altar.isUsing set value false
    
    # スケジュールまわりリセット
    scoreboard players reset @s arena.temp
    data modify entity @s data.arena.Scheduling set value ""