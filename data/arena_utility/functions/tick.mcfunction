## Tick
# クラフトアニメーション
execute at @a[tag=arena.Utility.Altar.User] as @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] if data entity @s {data:{arena:{Altar:{isCrafting:true}}}} at @s run function arena_utility:altar/crafting/animation/tick

# 離れたプレイヤー
execute as @a[tag=arena.Utility.Altar.User] at @s unless entity @e[tag=arena.Utility.Altar.Core,distance=..8] run function arena_utility:altar/user_left

# trigger
execute as @a if score @s arena.trigger = @s arena.trigger unless score @s arena.trigger matches 0 at @s run function arena_utility:score_triggered

# 直接エンチャント
function arena_utility:direct_enchanting/tick

# 経験値ブースト
execute if score #misc.exp_boost arena.utility matches 1.. run scoreboard players remove #misc.exp_boost arena.utility 1
execute if score #misc.exp_boost arena.utility matches 0 as @a at @s run function arena_utility:misc/exp_boost/on_end
