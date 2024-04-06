## Altar 設置
#> 各種エンティティ
    # Marker
    execute align xyz run summon marker ~0.5 ~1.375 ~0.5 {Tags:["arena.Utility.Altar.Core","arena.Utility.Altar.Element"],data:{arena:{Altar:{}}}}

    # Interaction
    execute at @e[tag=arena.Utility.Altar.Core] run summon interaction ~ ~-0.5 ~ {Tags:["arena.Utility.Altar.Interaction","arena.Utility.Altar.Element"],width:2.5f,height:0.25f}

    # Item Display
    execute at @e[tag=arena.Utility.Altar.Core] run summon item_display ~ ~-1 ~ {item:{id:"minecraft:firework_star",Count:1b,tag:{CustomModelData:1}},Tags:["arena.Utility.Altar.item_display","arena.Utility.Altar.Element"],"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.25f,1f,1.25f],translation:[0.0f,0.125f,0.0f]}}
