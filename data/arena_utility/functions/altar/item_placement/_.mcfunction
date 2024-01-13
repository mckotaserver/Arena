## Altar アイテム配置
# 合計配置個数に応じて配置方法を変更
        # 事前に配置されているものをkill
        execute at @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] run kill @e[tag=Arena.Utility.Altar.PlacedItemDisplay,distance=..2]
        execute at @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] run kill @e[tag=Arena.Utility.Altar.PlacedItemMount,distance=..2]

        execute unless data storage arena_utility:temp Altar.data.PlacedItem[0] run return 0

        # 個数を取得
        execute store result score #Utility.Altar.PlacedItemCount Arena.Temp run data get storage arena_utility:temp Altar.data.PlacedItem

        # Core Item
        execute if data storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}] at @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] positioned ~ ~0.5 ~ run function arena_utility:altar/item_placement/single/_ with storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}]

        # 1個 → その場
        execute if score #Utility.Altar.PlacedItemCount Arena.Temp matches 1 at @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] positioned ~ ~-0.25 ~ unless data storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}] run function arena_utility:altar/item_placement/single/_ with storage arena_utility:temp Altar.data.PlacedItem[0]

        # 2個以上 → Coreを中心の半径1.5の円の円周を等分する感じ
        execute if score #Utility.Altar.PlacedItemCount Arena.Temp matches 2.. at @e[tag=Arena.Utility.Altar.Core,sort=nearest,limit=1] positioned ~ ~-0.45 ~ run function arena_utility:altar/item_placement/multiple/_
