## Tick
# クラフトアニメーション
execute at @a[tag=arena.Utility.Altar.User] as @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] if data entity @s {data:{arena:{Altar:{isCrafting:true}}}} at @s run function arena_utility:altar/crafting/animation/tick

# 離れたプレイヤー
execute as @a[tag=arena.Utility.Altar.User] at @s unless entity @e[tag=arena.Utility.Altar.Core,distance=..8] run function arena_utility:altar/user_left
