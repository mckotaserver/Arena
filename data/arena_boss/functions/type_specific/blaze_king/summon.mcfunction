## ブレイズキング: 実召喚処理
#> Display
    # 棒部分
    summon item_display ~ ~ ~ {Tags:["Arena.Boss.Main.Parts","Arena.Boss.Main.Element","Arena.Boss.Main.Element-01"],item:{id:"minecraft:orange_dye",tag:{CustomModelData:2000010},Count:1b},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.1f,1.1f,1.1f],translation:[0f,1.1f,0f]},teleport_duration:2}
    summon item_display ~ ~ ~ {Tags:["Arena.Boss.Main.Parts","Arena.Boss.Main.Element","Arena.Boss.Main.Element-02"],item:{id:"minecraft:orange_dye",tag:{CustomModelData:2000011},Count:1b},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.1f,1.1f,1.1f],translation:[0f,1.1f,0f]},teleport_duration:2}
    summon item_display ~ ~ ~ {Tags:["Arena.Boss.Main.Parts","Arena.Boss.Main.Element","Arena.Boss.Main.Element-03"],item:{id:"minecraft:orange_dye",tag:{CustomModelData:2000012},Count:1b},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.1f,1.1f,1.1f],translation:[0f,1.1f,0f]},teleport_duration:2}
    summon item_display ~ ~ ~ {Tags:["Arena.Boss.Main.Parts","Arena.Boss.Main.Element","Arena.Boss.Main.Element-04"],item:{id:"minecraft:orange_dye",tag:{CustomModelData:2000013},Count:1b},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.1f,1.1f,1.1f],translation:[0f,1.1f,0f]},teleport_duration:2}

    # 板部
    summon item_display ~ ~ ~ {Tags:["Arena.Boss.Main.Parts","Arena.Boss.Main.Element","Arena.Boss.Main.Element-05"],item:{id:"minecraft:orange_dye",tag:{CustomModelData:2000020},Count:1b},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.1f,1.1f,1.1f],translation:[0f,1.1f,0f]},teleport_duration:2}
    summon item_display ~ ~ ~ {Tags:["Arena.Boss.Main.Parts","Arena.Boss.Main.Element","Arena.Boss.Main.Element-06"],item:{id:"minecraft:orange_dye",tag:{CustomModelData:2000021},Count:1b},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.1f,1.1f,1.1f],translation:[0f,1.1f,0f]},teleport_duration:2}

    # 頭部分
    summon item_display ~ ~ ~ {Tags:["Arena.Boss.Main.Parts","Arena.Boss.Main.Element","Arena.Boss.Main.Element-07"],item:{id:"minecraft:orange_dye",tag:{CustomModelData:2000030},Count:1b},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.1f,1.1f,1.1f],translation:[0f,1.1f,0f]},teleport_duration:2}

    # 胴部分
    summon item_display ~ ~ ~ {Tags:["Arena.Boss.Main.Parts","Arena.Boss.Main.Element","Arena.Boss.Main.Element-08"],item:{id:"minecraft:orange_dye",tag:{CustomModelData:2000040},Count:1b},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.1f,1.1f,1.1f],translation:[0f,1.1f,0f]},teleport_duration:2}

# 当たり判定
summon wither_skeleton ~ ~ ~ {Tags:["Arena.Boss.Main.Hitbox","Arena.Boss.Main.Element"],Silent:true,NoAI:true,PersistenceRequired:true,active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:false}],Attributes:[{Name:"minecraft:generic.max_health",Base:1024.0d}],DeathLootTable:"empty",Health:1024.0f}

#> 特殊
    # ふわふわ用
    summon marker ~ ~ ~ {Tags:["Arena.Boss.Main.Extra-01","Arena.Boss.Main.Element"]}

#> 共有処理
function arena_boss:type_specific/general/summon with entity @s data.Arena.Boss.StageData
function arena_boss:type_specific/blaze_king/animation/start {Animation:"regular"}
