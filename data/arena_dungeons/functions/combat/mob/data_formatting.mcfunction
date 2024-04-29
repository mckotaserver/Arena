#> arena_dungeons:combat/mob/data_formatting
# データ取得
$data modify storage arena_dungeons:temp mob_summon.data set from storage arena:assets dungeons.mobs[{id:"$(id)"}]

# nbt作成
    # オリジナル
    data modify storage arena_dungeons:temp mob_summon.nbt set from storage arena_dungeons:temp mob_summon.data.other_data

    # ArmorItems
    data modify storage arena_dungeons:temp mob_summon.nbt.ArmorItems set value [{},{},{},{}]

    data modify storage arena_dungeons:temp mob_summon.nbt.ArmorItems[0] set from storage arena_dungeons:temp mob_summon.data.inventory.armor.feet
    data modify storage arena_dungeons:temp mob_summon.nbt.ArmorItems[1] set from storage arena_dungeons:temp mob_summon.data.inventory.armor.legs
    data modify storage arena_dungeons:temp mob_summon.nbt.ArmorItems[2] set from storage arena_dungeons:temp mob_summon.data.inventory.armor.chest
    data modify storage arena_dungeons:temp mob_summon.nbt.ArmorItems[3] set from storage arena_dungeons:temp mob_summon.data.inventory.armor.head

    # HandItems
    data modify storage arena_dungeons:temp mob_summon.nbt.HandItems set value [{},{}]

    data modify storage arena_dungeons:temp mob_summon.nbt.HandItems[0] set from storage arena_dungeons:temp mob_summon.data.inventory.hand_items.mainhand
    data modify storage arena_dungeons:temp mob_summon.nbt.HandItems[1] set from storage arena_dungeons:temp mob_summon.data.inventory.hand_items.offhand

    # Attributes
    data modify storage arena_dungeons:temp mob_summon.nbt.Attributes set value []

    data modify storage arena_dungeons:temp mob_summon.nbt.Attributes append value {Name:"minecraft:generic.max_health",Base:0.0d}
    data modify storage arena_dungeons:temp mob_summon.nbt.Attributes append value {Name:"minecraft:generic.movement_speed",Base:0.0d}
    data modify storage arena_dungeons:temp mob_summon.nbt.Attributes append value {Name:"minecraft:generic.attack_damage",Base:0.0d}

    $execute store result storage arena_dungeons:temp mob_summon.nbt.Attributes[{Name:"minecraft:generic.max_health"}].Base double $(scale) run data get storage arena_dungeons:temp mob_summon.data.attributes.max_health
    data modify storage arena_dungeons:temp mob_summon.nbt.Attributes[{Name:"minecraft:generic.movement_speed"}].Base set from storage arena_dungeons:temp mob_summon.data.attributes.movement_speed
    $execute store result storage arena_dungeons:temp mob_summon.nbt.Attributes[{Name:"minecraft:generic.attack_damage"}].Base double $(scale) run data get storage arena_dungeons:temp mob_summon.data.attributes.attack_damage

    # その他
    data modify storage arena_dungeons:temp mob_summon.nbt.Health set value 1024.0f
    data modify storage arena_dungeons:temp mob_summon.entity_id set from storage arena_dungeons:temp mob_summon.data.entity

    data modify storage arena_dungeons:temp mob_summon.nbt.Tags set value ["arena.dungeons.mobs.main","arena.dungeons.mobs"]
    data modify storage arena_dungeons:temp mob_summon.nbt.DeathLootTable set from storage arena_dungeons:temp mob_summon.data.loot_table

