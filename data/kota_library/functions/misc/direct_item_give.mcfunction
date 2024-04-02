
execute unless data storage kota_library: direct_item_give.in[0] run return 0
summon item ~ 512 ~ {Item:{id:"minecraft:redstone",Count:1b,tag:{}},Tags:["kota_library.temp"]}

execute positioned ~ 512 ~ run data modify entity @e[tag=kota_library.temp,distance=0,limit=1] Item set from storage kota_library: direct_item_give.in[0]
execute positioned ~ 512 ~ run data modify entity @e[tag=kota_library.temp,distance=0,limit=1] PickupDelay set value 0

execute positioned ~ 512 ~ run tp @e[tag=kota_library.temp,distance=0,limit=1] @s

execute positioned ~ 512 ~ run tag @e[tag=kota_library.temp,distance=0,limit=1] remove kota_library.temp

data remove storage kota_library: direct_item_give.in[0]
execute if data storage kota_library: direct_item_give.in[0] run function kota_library:misc/direct_item_give
