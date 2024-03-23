## 使用中のプレイヤーが離れたとき
#> フラグの解除
    # 使用中
    data modify entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Altar.isUsing set value false

    # クラフト中
    data modify entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Altar.isCrafting set value false
    data modify entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Timer.EndTick set value 0

    data modify entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Scheduling set value ""

# タグ除去
tag @s remove Arena.Utility.Altar.User

kill @e[tag=arena.Utility.Altar.ProductDisplay,sort=nearest,limit=1]

# 卓上アイテムの回収
data modify storage arena_utility:temp Altar.data set from entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Altar
function arena_utility:altar/item_extraction/all

