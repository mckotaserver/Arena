## 選択されたtypeのものからランダムにまた選択
# tellraw awabi2048 ["Type List[0]: ",{"nbt":"quests.daily.selection.type_list[0]","storage": "arena_utility:temp","color": "aqua"}]
data remove storage arena_utility:temp quests.daily.selection.type_list[0]

#> ArrayPickerを利用
    # in設定
    data modify storage kota_library: array_picker.in set value []
    $data modify storage kota_library: array_picker.in append from storage arena_utility:temp quests.daily.selection.in[{requirement:{type:"$(type)"}}]
# $tellraw awabi2048 ["Type: ",{"text":"$(type)","color": "gold"}]
# tellraw awabi2048 ["Matched Input List: ",{"nbt":"array_picker.in","storage": "kota_library:","color": "light_purple"}]

    # index設定
        # 乱数生成
        execute store result score #quests_selection.index arena.temp run random value 0..999

        # inの要素数を取得
        execute store result score #quests_selection.in_list_count arena.temp run data get storage kota_library: array_picker.in

        # 上で取得した合計数で剰余演算
        scoreboard players operation #quests_selection.index arena.temp %= #quests_selection.in_list_count arena.temp
# tellraw awabi2048 ["Picking Index: ",{"score":{"name": "#quests_selection.index","objective": "arena.temp"},"color": "red"}]
# tellraw awabi2048 ["In List Count: ",{"score":{"name": "#quests_selection.in_list_count","objective": "arena.temp"},"color": "red"}]

        # ストレージにコピー
        execute store result storage kota_library: array_picker.index int 1 run scoreboard players get #quests_selection.index arena.temp

    # 実行
    data modify storage kota_library: array_picker.option.remove_index set value false
    function kota_library:storage_modifier/array_picker with storage kota_library: array_picker

    # 出力にappend
    data modify storage arena:quests daily append from storage kota_library: array_picker.out 
# tellraw awabi2048 ["Picked Out: ",{"nbt":"array_picker.out","storage": "kota_library:","color": "aqua"}]

#> 再起周り
    # 選択済みtypeを削除
    data modify storage arena_utility:temp quests.daily.selection.type set from storage arena_utility:temp quests.daily.selection.type_list[0]
    
    # 再起
    execute if data storage arena_utility:temp quests.daily.selection.type_list[0] run function arena_utility:quests/daily/selection with storage arena_utility:temp quests.daily.selection
