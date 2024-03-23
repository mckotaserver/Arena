## Altar 設置
#> 各種エンティティ
    # Marker
    execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["arena.Utility.Altar.Core","arena.Utility.Altar.Element"],data:{Arena:{Altar:{}}}}

    # Interaction
    execute at @e[tag=arena.Utility.Altar.Core] run summon interaction ~ ~-0.5 ~ {Tags:["arena.Utility.Altar.Interaction","arena.Utility.Altar.Element"],width:2.5f,height:0.25f}

    # Item Display
    