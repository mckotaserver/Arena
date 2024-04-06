## Altar アイテム取り出し
data modify storage kota_library: direct_item_give.in set value []
data modify storage kota_library: direct_item_give.in append from storage arena_utility:temp Altar.data.PlacedItem[-1]

function kota_library:misc/direct_item_give

#> 取り出し後の辻褄合わせ
# データから削除
data remove entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.arena.Altar.PlacedItem[-1]
data remove storage arena_utility:temp Altar.data.PlacedItem[-1]

# 表示の更新
function arena_utility:altar/item_placement/_
