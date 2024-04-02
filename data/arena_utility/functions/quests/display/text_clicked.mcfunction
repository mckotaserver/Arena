## テキストをクリックしたとき・・
# id の設定
    # trigger スコアの下一桁 → index の取得
    scoreboard players operation @s arena.trigger %= #10 Constant
    scoreboard players remove @s arena.trigger 1

    # array_picker でクエストの[index]番目を取得
    execute store result storage kota_library: array_picker.index int 1 run scoreboard players get @s arena.trigger
    $data modify storage kota_library: array_picker.in set from storage arena:quests $(type)
    
    function kota_library:storage_modifier/array_picker with storage kota_library: array_picker

    # 結果を代入
    data modify storage arena_quests:temp display.detailed.id set from storage kota_library: array_picker.out.id

# 進捗度の計算等
    # 目標値を取得
    data modify storage arena_quests:temp display.detailed.objective set value 0
    data modify storage arena_quests:temp display.detailed.objective set from storage kota_library: array_picker.out.requirement.count

    # 達成率の設定をコピー
    data modify storage arena_quests:temp display.detailed.enable_progress set from storage kota_library: array_picker.out.enable_progress

    # 現在の値の取得
        # @sの名前を取得
        function kota_library:misc/get_player_name

        # クエスト進捗データから @s のものを摘出
        data modify storage kota_library: compound_list_extractor.key set value "name"
        data modify storage kota_library: compound_list_extractor.value set from storage kota_library: get_player_name.out

        data modify storage kota_library: compound_list_extractor.in set from storage arena:quests player_data

        function kota_library:storage_modifier/compound_list_extractor with storage kota_library: compound_list_extractor

        # stats:[{id:"~", current_value: X},{~},{~}] 的な感じで保存されているので, array_picker を利用してほしいデータを取得
        $data modify storage kota_library: array_picker.in set from storage kota_library: compound_list_extractor.out[0].$(type)
        execute store result storage kota_library: array_picker.index int 1 run scoreboard players get @s arena.trigger

        function kota_library:storage_modifier/array_picker with storage kota_library: array_picker

        # 現在の値をコピー
        data modify storage arena_quests:temp display.detailed.current_value set value 0
        data modify storage arena_quests:temp display.detailed.current_value set from storage kota_library: array_picker.out.current_value

    # 割合なければ達成/未達成で判断
    execute if data storage arena_quests:temp {display:{detailed:{enable_progress:false}}} run data modify storage arena_quests:temp display.detailed.objective set value 1
    # execute if data storage arena_quests:temp {display:{detailed:{enable_progress:false}}} store result storage arena_quests:temp display.detailed.current_value int 1 if data storage kota_library: {array_picker:{out:{is_completed:true}}}

    # 目標値に対する割合を計算 (%)
    execute store result score #quests.progress_rate.result arena.temp run data get storage arena_quests:temp display.detailed.current_value 100
    execute store result score #quests.progress_rate.objective arena.temp run data get storage arena_quests:temp display.detailed.objective

    scoreboard players operation #quests.progress_rate.result arena.temp /= #quests.progress_rate.objective arena.temp 

    execute store result storage arena_quests:temp display.detailed.progress_rate int 1 run scoreboard players get #quests.progress_rate.result arena.temp

    execute if score #quests.progress_rate.result arena.temp matches 0..33 run data modify storage arena_quests:temp display.detailed.rate_color set value "red"
    execute if score #quests.progress_rate.result arena.temp matches 34..66 run data modify storage arena_quests:temp display.detailed.rate_color set value "yellow"
    execute if score #quests.progress_rate.result arena.temp matches 67..100 run data modify storage arena_quests:temp display.detailed.rate_color set value "green"

    # 進捗バーの生成
    data modify storage kota_library: progress_bar_generation set value {color_filled:"green",color_unfilled:"gray",length:50,alignment:"left"}
    execute store result storage kota_library: progress_bar_generation.percentage float 0.01 run scoreboard players get #quests.progress_rate.result arena.temp

    function kota_library:misc/progress_bar_generation/_ with storage kota_library: progress_bar_generation

    data modify storage arena_quests:temp display.detailed.progress_bar set from storage kota_library: progress_bar_generation.out

# macro 変数代入, tellraw
function arena_utility:quests/display/detailed with storage arena_quests:temp display.detailed
