## プレイヤーの名前を取得

forceload add 0 0 0 0

execute in overworld run loot spawn 0 512 0 loot kota_library:misc/fill_player_head

execute in overworld positioned 0 512 0 run data modify storage kota_library: get_player_name.out set from entity @e[type=item,distance=0,limit=1] Item.tag.SkullOwner.Name

execute in overworld positioned 0 512 0 run kill @e[type=item,distance=0]

execute unless entity @s[type=player] run data modify storage kota_library: get_player_name.out set value ""
