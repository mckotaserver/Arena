#> arena_utility:direct_enchanting/craft_attempt

# 必要個数を取得
execute store result score #utility.direct_enchanting.apply_cost arena.temp run data get entity @s Item.tag.arena.direct_enchanting.apply_cost

# 現在個数を取得
execute as @e[type=item,dx=0] if data entity @s {Item:{tag:{arena:{direct_enchanting:{item_type:"material"}}}}} store result score #utility.direct_enchanting.material_amount arena.temp run data get entity @s Item.Count

# 必要個数 <= 現在個数でなければreturn 0
execute unless score #utility.direct_enchanting.apply_cost arena.temp <= #utility.direct_enchanting.material_amount arena.temp run return 0

# 種類が一致か判定
execute as @e[type=item,dx=0] if data entity @s {Item:{tag:{arena:{direct_enchanting:{item_type:"tool"}}}}} run data modify storage arena_utility:temp direct_enchanting.id set from entity @s Item.tag.arena.direct_enchanting.available
execute as @e[type=item,dx=0] if data entity @s {Item:{tag:{arena:{direct_enchanting:{item_type:"book"}}}}} store success storage arena_utility:temp direct_enchanting.attempt_unavailable byte 1 run data modify storage arena_utility:temp direct_enchanting.id set from entity @s Item.tag.arena.direct_enchanting.id

# 違う → return 0
execute if data storage arena_utility:temp {direct_enchanting:{attempt_unavailable:true}} run return 0

# 
execute as @e[type=item,dx=0] if data entity @s {Item:{tag:{arena:{direct_enchanting:{item_type:"tool"}}}}} run data modify storage arena_utility:temp direct_enchanting.enchantments.tool set from entity @s Item.tag.Enchantments
execute as @e[type=item,dx=0] if data entity @s {Item:{tag:{arena:{direct_enchanting:{item_type:"book"}}}}} run data modify storage arena_utility:temp direct_enchanting.enchantments.book set from entity @s Item.tag.Enchantments

# 合成処理
    # 被っているエンチャントがあれば中断
    data modify storage kota_library: remove_duplicates.in set value []
    data modify storage kota_library: remove_duplicates.in append from storage arena_utility:temp direct_enchanting.enchantments.book[].id

    data modify storage kota_library: remove_duplicates.in append from storage arena_utility:temp direct_enchanting.enchantments.tool[].id

    execute store result score #utility.direct_enchanting.list_before arena.temp run data get storage kota_library: remove_duplicates.in

    function kota_library:storage_modifier/remove_duplicates

    execute store result score #utility.direct_enchanting.list_after arena.temp run data get storage kota_library: remove_duplicates.out

    execute unless score #utility.direct_enchanting.list_before arena.temp = #utility.direct_enchanting.list_after arena.temp run return 0

    # そのままappend
    execute as @e[type=item,dx=0] if data entity @s {Item:{tag:{arena:{direct_enchanting:{item_type:"tool"}}}}} run data modify entity @s Item.tag.Enchantments append from storage arena_utility:temp direct_enchanting.enchantments.book[]

    # 本をkill
    kill @s

    # 
    scoreboard players operation #utility.direct_enchanting.material_amount arena.temp -= #utility.direct_enchanting.apply_cost arena.temp
    execute as @e[type=item,dx=0] if data entity @s {Item:{tag:{arena:{direct_enchanting:{item_type:"material"}}}}} store result entity @s Item.Count byte 1 run scoreboard players get #utility.direct_enchanting.material_amount arena.temp

    # 演出
    particle witch ~0.5 ~0.75 ~0.5 0 0 0 0 20
    particle enchant ~0.5 ~1 ~0.5 0 0 0 1 20

    particle soul_fire_flame ~0.5 ~1 ~0.5 0 0 0 0.5 20

    execute positioned ~0.5 ~0.5 ~0.5 run playsound block.enchantment_table.use master @a ~ ~ ~ 1 1.2
    execute positioned ~0.5 ~0.5 ~0.5 run playsound block.smithing_table.use master @a ~ ~ ~ 1 0.75
    execute positioned ~0.5 ~0.5 ~0.5 run playsound entity.illusioner.cast_spell master @a ~ ~ ~ 1 1

