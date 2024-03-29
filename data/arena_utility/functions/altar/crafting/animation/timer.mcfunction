## Timer
    # 遅延により正しく計算されない場合がある → ±10tick幅をもたせる    
    execute at @e[tag=arena.Utility.Altar.Core,limit=1] store result score #CurrentTick.Min arena.temp run time query gametime
    
    scoreboard players operation #CurrentTick.Min arena.temp /= #20 Constant
    scoreboard players operation #CurrentTick.Min arena.temp *= #20 Constant

    scoreboard players operation #CurrentTick.Max arena.temp = #CurrentTick.Min arena.temp
    scoreboard players add #CurrentTick.Max arena.temp 19

    execute as @e[tag=arena.Utility.Altar.Core] store result score @s arena.temp run data get entity @s data.arena.Timer.EndTick


execute as @e[tag=arena.Utility.Altar.Core] if score #CurrentTick.Min arena.temp <= @s arena.temp if score @s arena.temp <= #CurrentTick.Max arena.temp at @s if data entity @s {data:{arena:{Scheduling:"arena_utility:altar/crafting/animation/end"}}} run function arena_utility:altar/crafting/animation/end
execute as @e[tag=arena.Utility.Altar.Core] if score #CurrentTick.Min arena.temp <= @s arena.temp if score @s arena.temp <= #CurrentTick.Max arena.temp at @s if data entity @s {data:{arena:{Scheduling:"arena_utility:altar/crafting/animation/product_give"}}} run function arena_utility:altar/crafting/animation/product_give

execute as @e[tag=arena.Utility.Altar.Core] if score #CurrentTick.Min arena.temp <= @s arena.temp if score @s arena.temp <= #CurrentTick.Max arena.temp run data modify entity @s data.arena.Scheduling set value ""


