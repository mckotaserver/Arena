## Altar 設置
#> 各種エンティティ
    # Marker
    execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["Arena.Utility.Altar.Core","Arena.Utility.Altar.Element"],data:{Arena:{}}}

    # Interaction
    execute at @e[tag=Arena.Utility.Altar.Core] run summon interaction ~ ~-0.5 ~ {Tags:["Arena.Utility.Altar.Interaction","Arena.Utility.Altar.Element"],width:2.5f,height:0.25f}

    # Item Display
    