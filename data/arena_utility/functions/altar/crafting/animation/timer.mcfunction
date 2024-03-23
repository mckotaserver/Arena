## Timer
    # 遅延により正しく計算されない場合がある → ±10tick幅をもたせる    
    execute at @e[tag=arena.Utility.Altar.Core,limit=1] store result score #CurrentTick.Min Arena.Temp run time query gametime
    
    scoreboard players operation #CurrentTick.Min Arena.Temp /= #20 Constant
    scoreboard players operation #CurrentTick.Min Arena.Temp *= #20 Constant

    scoreboard players operation #CurrentTick.Max Arena.Temp = #CurrentTick.Min Arena.Temp
    scoreboard players add #CurrentTick.Max Arena.Temp 19

    execute as @e[tag=arena.Utility.Altar.Core] store result score @s Arena.Temp run data get entity @s data.Arena.Timer.EndTick


execute as @e[tag=arena.Utility.Altar.Core] if score #CurrentTick.Min Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick.Max Arena.Temp at @s if data entity @s {data:{Arena:{Scheduling:"arena_utility:altar/crafting/animation/end"}}} run function arena_utility:altar/crafting/animation/end
execute as @e[tag=arena.Utility.Altar.Core] if score #CurrentTick.Min Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick.Max Arena.Temp at @s if data entity @s {data:{Arena:{Scheduling:"arena_utility:altar/crafting/animation/product_give"}}} run function arena_utility:altar/crafting/animation/product_give

execute as @e[tag=arena.Utility.Altar.Core] if score #CurrentTick.Min Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick.Max Arena.Temp run data modify entity @s data.Arena.Scheduling set value ""


