## Timer
execute store result score #EndTick Arena.Temp run time query gametime
execute as @e[tag=Arena.Utility.Altar.Core] store result score @s Arena.Temp run data get entity @s data.Arena.Timer.EndTick

execute as @e[tag=Arena.Utility.Altar.Core] if score @s Arena.Temp = #EndTick Arena.Temp at @s if data entity @s {data:{Arena:{Scheduling:"arena_utility:altar/crafting/animation/end"}}} run function arena_utility:altar/crafting/animation/end
execute as @e[tag=Arena.Utility.Altar.Core] if score @s Arena.Temp = #EndTick Arena.Temp at @s if data entity @s {data:{Arena:{Scheduling:"arena_utility:altar/crafting/animation/product_give"}}} run function arena_utility:altar/crafting/animation/product_give

execute as @e[tag=Arena.Utility.Altar.Core] if score @s Arena.Temp = #EndTick Arena.Temp run data modify entity @s data.Arena.Scheduling set value ""

execute as @e[tag=Arena.Utility.Altar.Core] run scoreboard players reset @s Arena.Temp

