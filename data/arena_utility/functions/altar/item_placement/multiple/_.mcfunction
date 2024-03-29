## Altar アイテム配置 (複数)
# アイテムごとの偏角を計算 (360.00 / Count)
    # 精度向上のため100倍値で取得
    execute store result score #Utility.Altar.PlacedItemCount arena.temp run data get storage arena_utility:temp Altar.data.PlacedItem
    execute if data storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}] run scoreboard players remove #Utility.Altar.PlacedItemCount arena.temp 1

    scoreboard players set #Utility.Altar.DisplayArgument arena.temp 36000

    # 配置個数で除算, マクロ利用のためストレージへ
    scoreboard players operation #Utility.Altar.DisplayArgument arena.temp /= #Utility.Altar.PlacedItemCount arena.temp
    execute store result storage arena_utility:temp Altar.DisplayArgument int 0.01 run scoreboard players get #Utility.Altar.DisplayArgument arena.temp

# 配置予定アイテムの一覧をコピー
data modify storage arena_utility:temp Altar.PlacingItem set from storage arena_utility:temp Altar.data.PlacedItem
data remove storage arena_utility:temp Altar.PlacingItem[{isCore:true}]

# 配置
function arena_utility:altar/item_placement/multiple/place with storage arena_utility:temp Altar
