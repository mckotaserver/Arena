#> arena_utility:direct_enchanting/tick
# 直接エンチャント君
execute as @a at @s if score @s arena.direct_enchanting.timer matches 1 as @e[type=item,distance=..4] if data entity @s Item.tag.arena.direct_enchanting.available at @s if block ~ ~ ~ enchanting_table align xyz as @e[type=item,dx=0] if data entity @s Item.tag.arena.direct_enchanting.apply_cost if entity @e[type=item,dx=0,nbt={Item:{tag:{arena:{direct_enchanting:{item_type:"material"}}}}}] run function arena_utility:direct_enchanting/craft_attempt

execute as @a if score @s arena.direct_enchanting.timer matches 1.. run scoreboard players remove @s arena.direct_enchanting.timer 1
execute as @a if score @s arena.direct_enchanting.timer matches 0 run scoreboard players set @s arena.direct_enchanting.timer 20

execute as @a at @s if entity @e[type=item,distance=..4,nbt={Item:{tag:{arena:{direct_enchanting:{item_type:"tool"}}}}}] unless score @s arena.direct_enchanting.timer = @s arena.direct_enchanting.timer run scoreboard players set @s arena.direct_enchanting.timer 20
execute as @a at @s unless entity @e[type=item,distance=..4] run scoreboard players reset @s arena.direct_enchanting.timer

