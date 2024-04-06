## Altar アイテム取り出し 全部
# データを目的アイテムに置換
data modify storage kota_library: direct_item_give.in set from storage arena_utility:temp Altar.data.PlacedItem
function kota_library:misc/direct_item_give

data remove entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.arena.Altar.PlacedItem[]
data remove storage arena_utility:temp Altar.data.PlacedItem[]

function arena_utility:altar/item_placement/_
