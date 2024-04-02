
summon item ~ 512 ~ {Item:{id:"minecraft:stone",Count:1b,tag:{}}}

execute positioned ~ 512 ~ run data modify entity @e[type=item,distance=0,limit=1] Item set from storage kota_library: direct_item_give.in[0]
execute positioned ~ 512 ~ run data modify entity @e[type=item,distance=0,limit=1] PickupDelay set value 0

execute positioned ~ 512 ~ run tp @e[type=item,distance=0,limit=1] ~ ~ ~

data remove storage kota_library: direct_item_give.in[0]
execute if data storage kota_library: direct_item_give.in[0] run function kota_library:misc/direct_item_give
