## モブデータ定義
data modify storage arena:assets dungeons.mobs set value []


#> test_zombie
    # id
    data modify storage arena:assets dungeons.mobs append value {id:"test_zombie"}

    # ステータスデータ
        # Health
        data modify storage arena:assets dungeons.mobs[-1].attributes.max_health set value 40.0d

        # Damage
        data modify storage arena:assets dungeons.mobs[-1].attributes.attack_damage set value 10.0d

        # Speed (倍率)
        data modify storage arena:assets dungeons.mobs[-1].attributes.movement_speed set value 0.3d
        
    # 所持アイテム
        # HandItems
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.mainhand set value {id:"minecraft:stone_sword",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.offhand set value {}

        # Armor
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.head set value {id:"minecraft:glass",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.chest set value {}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.legs set value {}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.feet set value {}

    # 討伐時
        # Loot Table
        data modify storage arena:assets dungeons.mobs[-1].loot_table set value "minecraft:entities/skeleton"

    # その他データ
        # entity_id
        data modify storage arena:assets dungeons.mobs[-1].entity set value "minecraft:zombie"

        # 他データ
        data modify storage arena:assets dungeons.mobs[-1].other_data set value {}


#># zombie
    # id
    data modify storage arena:assets dungeons.mobs append value {id:"zombie"}

    # ステータスデータ
        # Health
        data modify storage arena:assets dungeons.mobs[-1].attributes.max_health set value 20.0d

        # Damage
        data modify storage arena:assets dungeons.mobs[-1].attributes.attack_damage set value 3.0d

        # Speed (倍率)
        data modify storage arena:assets dungeons.mobs[-1].attributes.movement_speed set value 0.2d
        
    # 所持アイテム
        # HandItems
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.mainhand set value {id:"minecraft:wooden_sword",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.offhand set value {}

        # Armor
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.head set value {id:"minecraft:leather_helmet",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.chest set value {}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.legs set value {}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.feet set value {}

    # 討伐時
        # Loot Table
        data modify storage arena:assets dungeons.mobs[-1].loot_table set value "minecraft:entities/zombie"

    # その他データ
        # entity_id
        data modify storage arena:assets dungeons.mobs[-1].entity set value "minecraft:zombie"

        # 他データ
        data modify storage arena:assets dungeons.mobs[-1].other_data set value {}


#># skeleton
    # id
    data modify storage arena:assets dungeons.mobs append value {id:"skeleton"}

    # ステータスデータ
        # Health
        data modify storage arena:assets dungeons.mobs[-1].attributes.max_health set value 20.0d

        # Damage
        data modify storage arena:assets dungeons.mobs[-1].attributes.attack_damage set value 3.0d

        # Speed (倍率)
        data modify storage arena:assets dungeons.mobs[-1].attributes.movement_speed set value 0.2d
        
    # 所持アイテム
        # HandItems
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.mainhand set value {id:"minecraft:bow",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.offhand set value {}

        # Armor
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.head set value {id:"minecraft:leather_helmet",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.chest set value {}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.legs set value {}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.feet set value {}

    # 討伐時
        # Loot Table
        data modify storage arena:assets dungeons.mobs[-1].loot_table set value "minecraft:entities/skeleton"

    # その他データ
        # entity_id
        data modify storage arena:assets dungeons.mobs[-1].entity set value "minecraft:skeleton"

        # 他データ
        data modify storage arena:assets dungeons.mobs[-1].other_data set value {}


#># armored_zombie
    # id
    data modify storage arena:assets dungeons.mobs append value {id:"armored_zombie"}

    # ステータスデータ
        # Health
        data modify storage arena:assets dungeons.mobs[-1].attributes.max_health set value 30.0d

        # Damage
        data modify storage arena:assets dungeons.mobs[-1].attributes.attack_damage set value 3.0d

        # Speed (倍率)
        data modify storage arena:assets dungeons.mobs[-1].attributes.movement_speed set value 0.2d
        
    # 所持アイテム
        # HandItems
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.mainhand set value {id:"minecraft:stone_hoe",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.offhand set value {}

        # Armor
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.head set value {id:"minecraft:iron_helmet",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.chest set value {id:"minecraft:chainmail_chestplate",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.legs set value {id:"minecraft:chainmail_leggings",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.feet set value {id:"minecraft:iron_boots",Count:1b}

    # 討伐時
        # Loot Table
        data modify storage arena:assets dungeons.mobs[-1].loot_table set value "minecraft:entities/zombie"

    # その他データ
        # entity_id
        data modify storage arena:assets dungeons.mobs[-1].entity set value "minecraft:zombie"

        # 他データ
        data modify storage arena:assets dungeons.mobs[-1].other_data set value {}


#># armored_skeleton
    # id
    data modify storage arena:assets dungeons.mobs append value {id:"armored_skeleton"}

    # ステータスデータ
        # Health
        data modify storage arena:assets dungeons.mobs[-1].attributes.max_health set value 30.0d

        # Damage
        data modify storage arena:assets dungeons.mobs[-1].attributes.attack_damage set value 3.0d

        # Speed (倍率)
        data modify storage arena:assets dungeons.mobs[-1].attributes.movement_speed set value 0.2d
        
    # 所持アイテム
        # HandItems
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.mainhand set value {id:"minecraft:bow",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.offhand set value {}

        # Armor
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.head set value {id:"minecraft:iron_helmet",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.chest set value {id:"minecraft:chainmail_chestplate",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.legs set value {id:"minecraft:chainmail_leggings",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.feet set value {id:"minecraft:iron_boots",Count:1b}

    # 討伐時
        # Loot Table
        data modify storage arena:assets dungeons.mobs[-1].loot_table set value "minecraft:entities/skeleton"

    # その他データ
        # entity_id
        data modify storage arena:assets dungeons.mobs[-1].entity set value "minecraft:skeleton"

        # 他データ
        data modify storage arena:assets dungeons.mobs[-1].other_data set value {}


#># zombie_soldier
    # id
    data modify storage arena:assets dungeons.mobs append value {id:"zombie_soldier"}

    # ステータスデータ
        # Health
        data modify storage arena:assets dungeons.mobs[-1].attributes.max_health set value 35.0d

        # Damage
        data modify storage arena:assets dungeons.mobs[-1].attributes.attack_damage set value 4.0d

        # Speed (倍率)
        data modify storage arena:assets dungeons.mobs[-1].attributes.movement_speed set value 0.2d
        
    # 所持アイテム
        # HandItems
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.mainhand set value {id:"minecraft:stone_sword",Count:1b,tag:{display:{Name:'{"text":"ゾンビ兵の剣","color":"green","italic":false}',Lore:['{"text":"剣というには重すぎる。","color":"gray","italic":false}']},Enchantments:[{id:"minecraft:unbreaking",lvl:4s}]}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.offhand set value {}

        # Armor
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.head set value {}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.chest set value {id:"minecraft:iron_chestplate",Count:1b,tag:{display:{Name:'{"text":"ゾンビ兵のチェストプレート","color":"green","italic":false}'}}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.legs set value {id:"minecraft:leather_leggings",Count:1b,tag:{display:{Name:'{"text":"ゾンビ兵のレギンス","color":"green","italic":false}'}}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.feet set value {id:"minecraft:leather_boots",Count:1b,tag:{display:{Name:'{"text":"ゾンビ兵のブーツ","color":"green","italic":false}'}}}
    
    # 討伐時
        # Loot Table
        data modify storage arena:assets dungeons.mobs[-1].loot_table set value "minecraft:entities/zombie"

    # その他データ
        # entity_id
        data modify storage arena:assets dungeons.mobs[-1].entity set value "minecraft:zombie"

        # 他データ
        data modify storage arena:assets dungeons.mobs[-1].other_data set value {}


#># skeleton_soldier
    # id
    data modify storage arena:assets dungeons.mobs append value {id:"skeleton_soldier"}

    # ステータスデータ
        # Health
        data modify storage arena:assets dungeons.mobs[-1].attributes.max_health set value 30.0d

        # Damage
        data modify storage arena:assets dungeons.mobs[-1].attributes.attack_damage set value 4.0d

        # Speed (倍率)
        data modify storage arena:assets dungeons.mobs[-1].attributes.movement_speed set value 0.2d
        
    # 所持アイテム
        # HandItems
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.mainhand set value {id:"minecraft:stone_sword",Count:1b,tag:{display:{Name:'{"text":"スケルトン兵の剣","color":"green","italic":false}',Lore:['{"text":"剣というよりは石の塊だ。","color":"gray","italic":false}']},Enchantments:[{id:"minecraft:unbreaking",lvl:4s}]}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.offhand set value {}

        # Armor
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.head set value {}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.chest set value {id:"minecraft:iron_chestplate",Count:1b,tag:{display:{Name:'{"text":"スケルトン兵のチェストプレート","color":"green","italic":false}'}}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.legs set value {id:"minecraft:leather_leggings",Count:1b,tag:{display:{Name:'{"text":"スケルトン兵のレギンス","color":"green","italic":false}'}}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.feet set value {id:"minecraft:leather_boots",Count:1b,tag:{display:{Name:'{"text":"スケルトン兵のブーツ","color":"green","italic":false}'}}}

    # 討伐時
        # Loot Table
        data modify storage arena:assets dungeons.mobs[-1].loot_table set value "minecraft:entities/skeleton"

    # その他データ
        # entity_id
        data modify storage arena:assets dungeons.mobs[-1].entity set value "minecraft:skeleton"

        # 他データ
        data modify storage arena:assets dungeons.mobs[-1].other_data set value {}


#># zombie_knight
    # id
    data modify storage arena:assets dungeons.mobs append value {id:"zombie_knight"}

    # ステータスデータ
        # Health
        data modify storage arena:assets dungeons.mobs[-1].attributes.max_health set value 40.0d

        # Damage
        data modify storage arena:assets dungeons.mobs[-1].attributes.attack_damage set value 4.0d

        # Speed (倍率)
        data modify storage arena:assets dungeons.mobs[-1].attributes.movement_speed set value 0.25d
        
    # 所持アイテム
        # HandItems
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.mainhand set value {id:"minecraft:iron_sword",Count:1b,tag:{display:{Name:'{"text":"ゾンビ騎士の剣","color":"green","italic":false}',Lore:['{"text":"かなり錆びている。","color":"gray","italic":false}']},Enchantments:[{id:"minecraft:unbreaking",lvl:4s},{id:"minecraft:sharpness",lvl:2s}]}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.offhand set value {}

        # Armor
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.head set value {id:"minecraft:golden_helmet",Count:1b,tag:{display:{Name:'{"text":"ゾンビ騎士のヘルメット","color":"green","italic":false}'}}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.chest set value {id:"minecraft:golden_chestplate",Count:1b,tag:{display:{Name:'{"text":"ゾンビ騎士のチェストプレート","color":"green","italic":false}'}}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.legs set value {id:"minecraft:golden_leggings",Count:1b,tag:{display:{Name:'{"text":"ゾンビ騎士のレギンス","color":"green","italic":false}'}}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.feet set value {id:"minecraft:golden_boots",Count:1b,tag:{display:{Name:'{"text":"ゾンビ騎士のブーツ","color":"green","italic":false}'}}}

    # 討伐時
        # Loot Table
        data modify storage arena:assets dungeons.mobs[-1].loot_table set value "minecraft:entities/zombie"

    # その他データ
        # entity_id
        data modify storage arena:assets dungeons.mobs[-1].entity set value "minecraft:zombie"

        # 他データ
        data modify storage arena:assets dungeons.mobs[-1].other_data set value {}


#># skeleton_knight
    # id
    data modify storage arena:assets dungeons.mobs append value {id:"skeleton_knight"}

    # ステータスデータ
        # Health
        data modify storage arena:assets dungeons.mobs[-1].attributes.max_health set value 40.0d

        # Damage
        data modify storage arena:assets dungeons.mobs[-1].attributes.attack_damage set value 4.0d

        # Speed (倍率)
        data modify storage arena:assets dungeons.mobs[-1].attributes.movement_speed set value 0.25d
        
    # 所持アイテム
        # HandItems
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.mainhand set value {id:"minecraft:iron_sword",Count:1b,tag:{display:{Name:'{"text":"スケルトン騎士の剣","color":"green","italic":false}',Lore:['{"text":"ところどころ錆びている。","color":"gray","italic":false}']},Enchantments:[{id:"minecraft:unbreaking",lvl:4s},{id:"minecraft:sharpness",lvl:3s}]}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.offhand set value {}

        # Armor
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.head set value {id:"minecraft:golden_helmet",Count:1b,tag:{display:{Name:'{"text":"スケルトン騎士のヘルメット","color":"green","italic":false}'}}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.chest set value {id:"minecraft:golden_chestplate",Count:1b,tag:{display:{Name:'{"text":"スケルトン騎士のチェストプレート","color":"green","italic":false}'}}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.legs set value {id:"minecraft:golden_leggings",Count:1b,tag:{display:{Name:'{"text":"スケルトン騎士のレギンス","color":"green","italic":false}'}}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.feet set value {id:"minecraft:golden_boots",Count:1b,tag:{display:{Name:'{"text":"スケルトン騎士のブーツ","color":"green","italic":false}'}}}

    # 討伐時
        # Loot Table
        data modify storage arena:assets dungeons.mobs[-1].loot_table set value "minecraft:entities/skeleton"

    # その他データ
        # entity_id
        data modify storage arena:assets dungeons.mobs[-1].entity set value "minecraft:skeleton"

        # 他データ
        data modify storage arena:assets dungeons.mobs[-1].other_data set value {}


#># wondering_undead
    # id
    data modify storage arena:assets dungeons.mobs append value {id:"wondering_undead"}

    # ステータスデータ
        # Health
        data modify storage arena:assets dungeons.mobs[-1].attributes.max_health set value 20.0d

        # Damage
        data modify storage arena:assets dungeons.mobs[-1].attributes.attack_damage set value 8.0d

        # Speed (倍率)
        data modify storage arena:assets dungeons.mobs[-1].attributes.movement_speed set value 0.15d
        
    # 所持アイテム
        # HandItems
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.mainhand set value {id:"minecraft:diamond_hoe",Count:1b,tag:{display:{Name:'{"text":"さまようアンデッドの鎌","color":"dark_purple","italic":false}',Lore:['{"text":"恨めしい・・。","color":"gray","italic":false}']},Enchantments:[{id:"minecraft:knockback",lvl:3s},{id:"minecraft:unbreaking",lvl:3s}]}}
        data modify storage arena:assets dungeons.mobs[-1].inventory.hand_items.offhand set value {}

        # Armor
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.head set value {id:"minecraft:zombie_head",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.chest set value {id:"minecraft:golden_chestplate",Count:1b}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.legs set value {}
        data modify storage arena:assets dungeons.mobs[-1].inventory.armor.feet set value {}

    # 討伐時
        # Loot Table
        data modify storage arena:assets dungeons.mobs[-1].loot_table set value "minecraft:entities/skeleton"

    # その他データ
        # entity_id
        data modify storage arena:assets dungeons.mobs[-1].entity set value "minecraft:skeleton"

        # 他データ
        data modify storage arena:assets dungeons.mobs[-1].other_data set value {active_effects:[{duration:-1,show_icon:false,amplifier:false,ambient:false,id:"minecraft:invisibility",show_particles:false}]}

