## Altar アイテム配置 (1個)
#> ディスプレイの配置
    # item を召喚, macroでデータ代入
    
    $summon item ~ ~ ~ {Tags:["Arena.Utility.Altar.PlacedItemDisplay","Arena.Utility.Altar.PlacedItemDisplay-Unedited","Arena.Utility.Altar.Element"],PickupDelay:-1,Age:-32768s,NoGravity:true,Item:{"id":"$(id)",Count:$(Count)b,tag:$(tag)}}

    summon item_display ~ ~ ~ {Tags:["Arena.Utility.Altar.PlacedItemMount","Arena.Utility.Altar.PlacedItemMount-Unedited"]}
    ride @e[tag=Arena.Utility.Altar.PlacedItemDisplay-Unedited,limit=1] mount @e[tag=Arena.Utility.Altar.PlacedItemMount-Unedited,limit=1]

    execute if data storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}] run kill @e[tag=Arena.Utility.Altar.PlacedItemMount-Unedited]
    
    tag @e[tag=Arena.Utility.Altar.PlacedItemDisplay-Unedited] remove Arena.Utility.Altar.PlacedItemDisplay-Unedited
    tag @e[tag=Arena.Utility.Altar.PlacedItemMount-Unedited] remove Arena.Utility.Altar.PlacedItemMount-Unedited

    
    
    # ついでにパーティクル
    particle witch ~ ~ ~ 0 0 0 0 3
    particle smoke ~ ~ ~ 0 0 0 0.1 3
    