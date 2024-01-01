## Tick
# クラフトアニメーション
execute at @a[tag=Arena.Utility.Altar.User] as @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] if data entity @s {data:{Arena:{Altar:{isCrafting:true}}}} at @s run function arena_utility:altar/crafting/animation/tick

# 離れたプレイヤー
execute as @a[tag=Arena.Utility.Altar.User] at @s unless entity @e[tag=Arena.Utility.Altar.Core,distance=..8] run function arena_utility:altar/user_left
