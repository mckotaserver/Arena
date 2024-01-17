## Timer
    # 遅延により正しく計算されない場合がある → ±10tick幅をもたせる    
    execute at @e[tag=Arena.Utility.Altar.Core,limit=1] store result score #CurretnTick.Min Arena.Temp run time query gametime
    
    scoreboard players operation #CurretnTick.Min Arena.Temp /= #20 Constant
    scoreboard players operation #CurretnTick.Min Arena.Temp *= #20 Constant

    scoreboard players operation #CurretnTick.Max Arena.Temp = #CurretnTick.Min Arena.Temp
    scoreboard players add #CurretnTick.Max Arena.Temp 19

    execute as @e[tag=Arena.Utility.Altar.Core] store result score @s Arena.Temp run data get entity @s data.Arena.Timer.CurretnTick


execute as @e[tag=Arena.Utility.Altar.Core] if score #CurretnTick.Min Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurretnTick.Max Arena.Temp at @s if data entity @s {data:{Arena:{Scheduling:"arena_utility:altar/crafting/animation/end"}}} run function arena_utility:altar/crafting/animation/end
execute as @e[tag=Arena.Utility.Altar.Core] if score #CurretnTick.Min Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurretnTick.Max Arena.Temp at @s if data entity @s {data:{Arena:{Scheduling:"arena_utility:altar/crafting/animation/product_give"}}} run function arena_utility:altar/crafting/animation/product_give

execute as @e[tag=Arena.Utility.Altar.Core] if score #CurretnTick.Min Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurretnTick.Max Arena.Temp run data modify entity @s data.Arena.Scheduling set value ""

execute as @e[tag=Arena.Utility.Altar.Core] run scoreboard players reset @s Arena.Temp

