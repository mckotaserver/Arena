## Altar アイテム配置 (複数)
# アイテムごとの偏角を計算 (360.00 / Count)
    # 精度向上のため100倍値で取得
    execute store result score #Utility.Altar.PlacedItemCount Arena.Temp run data get storage arena_utility:temp Altar.data.PlacedItem
    execute if data storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}] run scoreboard players remove #Utility.Altar.PlacedItemCount Arena.Temp 1

    scoreboard players set #Utility.Altar.DisplayArgument Arena.Temp 36000

    # 配置個数で除算, マクロ利用のためストレージへ
    scoreboard players operation #Utility.Altar.DisplayArgument Arena.Temp /= #Utility.Altar.PlacedItemCount Arena.Temp
    execute store result storage arena_utility:temp Altar.DisplayArgument float 0.01 run scoreboard players get #Utility.Altar.DisplayArgument Arena.Temp

# 配置予定アイテムの一覧をコピー
data modify storage arena_utility:temp Altar.PlacingItem set from storage arena_utility:temp Altar.data.PlacedItem
data remove storage arena_utility:temp Altar.PlacingItem[{isCore:true}]

# 配置
function arena_utility:altar/item_placement/multiple/place with storage arena_utility:temp Altar
