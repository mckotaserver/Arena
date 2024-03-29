## Altar アイテム配置 (1個)
#> ディスプレイの配置
    # item を召喚, macroでデータ代入
    
    $summon item ~ ~ ~ {Tags:["arena.Utility.Altar.PlacedItemDisplay","arena.Utility.Altar.PlacedItemDisplay-Unedited","arena.Utility.Altar.Element"],PickupDelay:32767s,Age:-32768s,NoGravity:true,Item:{"id":"$(id)",Count:$(Count)b,tag:$(tag)}}

    summon item_display ~ ~ ~ {Tags:["arena.Utility.Altar.PlacedItemMount","arena.Utility.Altar.PlacedItemMount-Unedited"]}
    ride @e[tag=arena.Utility.Altar.PlacedItemDisplay-Unedited,limit=1] mount @e[tag=arena.Utility.Altar.PlacedItemMount-Unedited,limit=1]

    execute if data storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}] run kill @e[tag=arena.Utility.Altar.PlacedItemMount-Unedited]
    
    tag @e[tag=arena.Utility.Altar.PlacedItemDisplay-Unedited] remove arena.Utility.Altar.PlacedItemDisplay-Unedited
    tag @e[tag=arena.Utility.Altar.PlacedItemMount-Unedited] remove arena.Utility.Altar.PlacedItemMount-Unedited
   
    
    # ついでにパーティクル
    particle witch ~ ~ ~ 0 0 0 0 3
    particle smoke ~ ~ ~ 0 0 0 0.1 3
    