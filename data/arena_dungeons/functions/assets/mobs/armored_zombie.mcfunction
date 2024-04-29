## モブデータ定義
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
    # エンチャント経験値
    data modify storage arena:assets dungeons.mobs[-1].loot.experience set value 10

    # Loot Table
    data modify storage arena:assets dungeons.mobs[-1].loot_table set value "minecraft:entities/skeleton"

# その他データ
    # entity_id
    data modify storage arena:assets dungeons.mobs[-1].entity set value "minecraft:zombie"

    # 他データ
    data modify storage arena:assets dungeons.mobs[-1].other_data set value {}


