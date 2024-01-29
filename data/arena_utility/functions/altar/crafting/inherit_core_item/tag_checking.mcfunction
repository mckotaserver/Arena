## Tag指定アイテムのチェック
    # 比較対象のidを取得
    data modify storage arena_utility:temp Altar.Crafting.core_checking.id set from storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}].id

    # 比較リストの[0]と一致するか判定
    execute store success storage arena_utility:temp Altar.Crafting.core_checking.compare_result byte 1 run data modify storage arena_utility:temp Altar.Crafting.core_checking.id set from storage arena_utility:temp Altar.Crafting.core_checking.list[0]

    # 一致 → フラグ変更して処理終了
    execute if data storage arena_utility:temp {Altar:{Crafting:{core_checking:{compare_result:0b}}}} run data modify storage arena_utility:temp Altar.Crafting.core_checking.succeeded set value true
    execute if data storage arena_utility:temp {Altar:{Crafting:{core_checking:{compare_result:0b}}}} run return 0

    # 不一致 → リスト[0]を削除して再起
    execute if data storage arena_utility:temp {Altar:{Crafting:{core_checking:{compare_result:1b}}}} run data remove storage arena_utility:temp Altar.Crafting.core_checking.list[0]
    execute if data storage arena_utility:temp {Altar:{Crafting:{core_checking:{compare_result:1b}}}} if data storage arena_utility:temp Altar.Crafting.core_checking.list[0] run function arena_utility:altar/crafting/inherit_core_item/tag_checking

