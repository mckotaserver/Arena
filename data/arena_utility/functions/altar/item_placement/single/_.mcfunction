## Altar アイテム配置 (1個)
#> ディスプレイの配置
    # item を召喚, macroでデータ代入
    
    $summon item ~ ~ ~ {Tags:["Arena.Utility.Altar.PlacedItemDisplay","Arena.Utility.Altar.Element"],PickupDelay:-1,Health:-32768s,NoGravity:true,Item:{"id":"$(id)",Count:$(Count),tag:$(tag)}}

    # ついでにパーティクル
    particle witch ~ ~ ~ 0 0 0 0 3
    particle smoke ~ ~ ~ 0 0 0 0.1 3
    