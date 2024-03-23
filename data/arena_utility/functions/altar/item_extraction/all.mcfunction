## Altar アイテム取り出し 全部
# 仮item召喚
summon item ~ ~ ~ {Tags:["arena.Temp"],Item:{id:"minecraft:stone","Count":1b,tag:{}},PickupDelay:0}

# データを目的アイテムに置換
data modify entity @e[tag=arena.Temp,limit=1] Item set from storage arena_utility:temp Altar.data.PlacedItem[0]
tag @e[tag=arena.Temp] remove Arena.Temp

# 処理済みのデータを削除
data remove storage arena_utility:temp Altar.data.PlacedItem[0]

# 再起
execute if data storage arena_utility:temp Altar.data.PlacedItem[0] run function arena_utility:altar/item_extraction/all

# 一度だけ実行
execute unless data storage arena_utility:temp Altar.data.PlacedItem[0] at @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] run kill @e[tag=arena.Utility.Altar.PlacedItemDisplay,distance=..2]
execute unless data storage arena_utility:temp Altar.data.PlacedItem[0] at @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] run kill @e[tag=arena.Utility.Altar.PlacedItemMount,distance=..2]

execute unless data storage arena_utility:temp Altar.data.PlacedItem[0] at @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] run data modify entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Altar.PlacedItem set value []
execute unless data storage arena_utility:temp Altar.data.PlacedItem[0] at @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] run data modify storage arena_utility:temp Altar.data.PlacedItem set value []
