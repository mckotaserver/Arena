## デイリークエスト 更新時
#> 3つのtypeを選択
    # 指定されたrequirement.typeの個数を取得.
        # ライブラリを利用
        data modify storage kota_library: remove_duplicates.in set value []
        data modify storage kota_library: remove_duplicates.in append from storage arena:assets utility.quests[{type:"daily"}].requirement.type

        function kota_library:storage_modifier/remove_duplicates

# tellraw awabi2048 ["RD out: ",{"nbt":"remove_duplicates.out","storage": "kota_library:"}]

    # ランダム抽出 (3つ)
        # ライブラリを利用
        data modify storage kota_library: random_array_picker.option set value {count:3}
        data modify storage kota_library: random_array_picker.in set from storage kota_library: remove_duplicates.out

        function kota_library:storage_modifier/random_array_picker {count:3,allow_duplicates:false}

# tellraw awabi2048 ["RAP out: ",{"nbt":"random_array_picker.out","storage": "kota_library:"}]

#> ↑でtypeを選んだので、これをもとにクエスト選択
    # 出力をリセット
    data modify storage arena:quests daily set value [] 

    # 抽出元をセット
    data modify storage arena_utility:temp quests.daily.selection.in set value []
    data modify storage arena_utility:temp quests.daily.selection.in append from storage arena:assets utility.quests[{type:"daily"}]

    # ↑の出力をコピー
    data modify storage arena_utility:temp quests.daily.selection.type_list set from storage kota_library: random_array_picker.out

    # 初回動作のセットアップ
    data modify storage arena_utility:temp quests.daily.selection.type set from storage arena_utility:temp quests.daily.selection.type_list[0]
# tellraw awabi2048 {"text": "============== START OF SELECTION ============","color": "gray"}
    # 関数呼び出し
    function arena_utility:quests/daily/selection with storage arena_utility:temp quests.daily.selection


# tellraw awabi2048 {"text": "============== END OF SELECTION ============","color": "gray"}

#> プレイヤーごとの記録をリセット
data remove storage arena:quests player_data[].daily
