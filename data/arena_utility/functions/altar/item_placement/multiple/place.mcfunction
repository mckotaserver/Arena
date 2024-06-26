## Altar アイテム配置 (複数)
#> ディスプレイの配置
    # item を召喚    
    summon item ^ ^ ^1.5 {Tags:["arena.Utility.Altar.PlacedItemDisplay","arena.Utility.Altar.PlacedItemDisplay-Unedited","arena.Utility.Altar.Element"],PickupDelay:32767s,Age:-32768s,NoGravity:true,Item:{"id":"minecraft:stone_button",Count:1b,tag:{}}}

    summon item_display ^ ^ ^1.5 {Tags:["arena.Utility.Altar.PlacedItemMount","arena.Utility.Altar.PlacedItemMount-Unedited"]}
    ride @e[tag=arena.Utility.Altar.PlacedItemDisplay-Unedited,limit=1] mount @e[tag=arena.Utility.Altar.PlacedItemMount-Unedited,limit=1]

    # item にデータを代入
    data modify entity @e[tag=arena.Utility.Altar.PlacedItemDisplay-Unedited,limit=1] Item set from storage arena_utility:temp Altar.PlacingItem[0]

    # スタック防止: 適当なデータを設定
    execute store result entity @e[tag=arena.Utility.Altar.PlacedItemDisplay-Unedited,limit=1] Item.tag.arena.Altar.DisplayData int 1 run random value 0..100000

    # 未処理タグの削除
    tag @e[tag=arena.Utility.Altar.PlacedItemDisplay-Unedited] remove arena.Utility.Altar.PlacedItemDisplay-Unedited
    tag @e[tag=arena.Utility.Altar.PlacedItemMount-Unedited] remove arena.Utility.Altar.PlacedItemMount-Unedited

#> 再起
    # 処理済みのデータは削除
    data remove storage arena_utility:temp Altar.PlacingItem[0]
    
#> 演出
    # ついでにパーティクル
    particle witch ^ ^ ^1.5 0 0 0 0 3
    particle smoke ^ ^ ^1.5 0 0 0 0.1 3

    # 偏角だけ移動して再起
    $execute if data storage arena_utility:temp Altar.PlacingItem[0] rotated ~$(DisplayArgument) 0 run function arena_utility:altar/item_placement/multiple/place with storage arena_utility:temp Altar

