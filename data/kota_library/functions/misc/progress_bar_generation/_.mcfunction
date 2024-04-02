## 進捗バー |||| の生成
# ループ回数の計算
    # 達成済み
    $execute store result storage kota_library:temp progress_bar_generation.count_filled int $(percentage) run data get storage kota_library: progress_bar_generation.length

    # 未達成
        # スコアに変換
        execute store result score #progress_bar_generation.count_filled kota_library.temp run data get storage kota_library:temp progress_bar_generation.count_filled 
        execute store result score #progress_bar_generation.count_unfilled kota_library.temp run data get storage kota_library: progress_bar_generation.length

        # 減算
        scoreboard players operation #progress_bar_generation.count_unfilled kota_library.temp -= #progress_bar_generation.count_filled kota_library.temp

        # ストレージに代入
        execute store result storage kota_library:temp progress_bar_generation.count_unfilled int 1 run scoreboard players get #progress_bar_generation.count_unfilled kota_library.temp

# 出力リセット
data modify storage kota_library:temp progress_bar_generation.out.filled set value ""
data modify storage kota_library:temp progress_bar_generation.out.unfilled set value ""
data remove storage kota_library: progress_bar_generation.out

# 再帰処理開始
execute if data storage kota_library: {progress_bar_generation:{alignment:"left"}} run function kota_library:misc/progress_bar_generation/filled_construction with storage kota_library:temp progress_bar_generation.out 
# execute if data storage kota_library: {progress_bar_generation:{alignment:"right"}} run function kota_library:misc/progress_bar_generation/unfilled_construction with storage kota_library:temp progress_bar_generation.out

# 出力
data modify storage kota_library:temp progress_bar_generation.out.color_filled set from storage kota_library: progress_bar_generation.color_filled 
data modify storage kota_library:temp progress_bar_generation.out.color_unfilled set from storage kota_library: progress_bar_generation.color_unfilled

function kota_library:misc/progress_bar_generation/output with storage kota_library:temp progress_bar_generation.out
