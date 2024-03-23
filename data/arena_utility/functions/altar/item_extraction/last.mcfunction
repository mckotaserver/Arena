## Altar アイテム取り出し
#> プレイヤーにアイテム返す
    # 一時コンテナ シュルカーボックス設置
    setblock ~ -64 ~ shulker_box replace

    # シュルカーボックスにデータ代入
        # 一時的にストレージで処理
        data modify storage arena_utility:temp Altar.ItemExtraction.Item set from entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Altar.PlacedItem[-1]

        # シュルカーボックスに入れるアイテムのデータ作成
        data modify storage arena_utility:temp Altar.ItemExtraction.Out set value {}

        data modify storage arena_utility:temp Altar.ItemExtraction.Out.id set from storage arena_utility:temp Altar.ItemExtraction.Item.id
        data modify storage arena_utility:temp Altar.ItemExtraction.Out.Count set from storage arena_utility:temp Altar.ItemExtraction.Item.Count
        data modify storage arena_utility:temp Altar.ItemExtraction.Out.tag set from storage arena_utility:temp Altar.ItemExtraction.Item.tag

            # tagが空かどうか確認
            scoreboard players set #TagCompound Arena.Temp 0
            execute store result score #TagCompound Arena.Temp run data get storage arena_utility:temp Altar.ItemExtraction.Item.tag

            execute if score #TagCompound Arena.Temp matches 0 run data remove storage arena_utility:temp Altar.ItemExtraction.Out.tag

        data modify storage arena_utility:temp Altar.ItemExtraction.Out.Slot set value 0b

    # 代入
    data modify block ~ -64 ~ Items append from storage arena_utility:temp Altar.ItemExtraction.Out

    # Loot Tableでgive
    loot give @s mine ~ -64 ~ debug_stick

    # 一時コンテナ 削除
    setblock ~ -64 ~ air replace

#> 取り出し後の辻褄合わせ
# データから削除
data remove entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Altar.PlacedItem[-1]
data remove storage arena_utility:temp Altar.data.PlacedItem[-1]

# 表示の更新
function arena_utility:altar/item_placement/_
