## 時間単位変換
# ストレージのリセット
data modify storage kota_library: time_unit_conversion set value {}

# 一時スコアボード
    # スコアボードの定義
    scoreboard objectives add kota_library.temp dummy

    # 定数値の設定
    scoreboard players set #constant.20 kota_library.temp 20
    scoreboard players set #constant.60 kota_library.temp 60

# 設定の確認, 処理分岐
$function kota_library:misc/time_unit_conversion/$(option) {in:$(in)}

# スコアボード削除
scoreboard objectives remove kota_library.temp
