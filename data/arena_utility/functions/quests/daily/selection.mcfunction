## 選択されたtypeのものからランダムにまた選択
data remove storage arena_utility:temp quests.daily.selection.type_list[0]

#> ArrayPickerを利用
    # in設定
    data modify storage kota_library: array_picker.in set value []
    $data modify storage kota_library: array_picker.in append from storage arena_utility:temp quests.daily.selection.in[{requirement:{type:"$(type)"}}]
    
    # index設定
        # 乱数生成
        execute store result score #quests_selection.index Arena.Temp run random value 0..999

        # inの要素数を取得
        execute store result score #quests_selection.in_list_count Arena.Temp run data get storage kota_library: random_array_picker.in

        # 上で取得した合計数で剰余演算
        scoreboard players operation #quests_selection.index Arena.Temp %= #quests_selection.in_list_count Arena.Temp

        # ストレージにコピー
        execute store result storage kota_library: array_picker.index int 1 run scoreboard players get #quests_selection.index Arena.Temp

    # 実行
    data modify storage kota_library: array_picker.option.remove_index set value false
    function kota_library:storage_modifier/array_picker with storage kota_library: array_picker

    # 出力にappend
    data modify storage arena:quests daily append from storage kota_library: array_picker.out 

#> 再起周り
    # 選択済みtypeを削除
    data modify storage arena_utility:temp quests.daily.selection.type set from storage arena_utility:temp quests.daily.selection.type_list[0]
    
    # 再起
    execute if data storage arena_utility:temp quests.daily.selection.type_list[0] run function arena_utility:quests/daily/selection with storage arena_utility:temp quests.daily.selection
