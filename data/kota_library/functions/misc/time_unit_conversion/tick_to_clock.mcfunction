## 時間単位変換: tick → 時刻
    #> スコア計算
        # 入力値の設定
        $scoreboard players set #time_unit_conversion.in kota_library.temp $(in)

        # 時間/分/秒/小数点以下 の値セット
        scoreboard players operation #time_unit_conversion.hour kota_library.temp = #time_unit_conversion.in kota_library.temp
        scoreboard players operation #time_unit_conversion.minute kota_library.temp = #time_unit_conversion.in kota_library.temp
        scoreboard players operation #time_unit_conversion.second kota_library.temp = #time_unit_conversion.in kota_library.temp
        scoreboard players operation #time_unit_conversion.decimal kota_library.temp = #time_unit_conversion.in kota_library.temp

            # 小数点以下 → tick %20 *20
            scoreboard players operation #time_unit_conversion.decimal kota_library.temp %= #constant.20 kota_library.temp
            scoreboard players operation #time_unit_conversion.decimal kota_library.temp *= #constant.20 kota_library.temp

            # 秒 → tick /20 %60
            scoreboard players operation #time_unit_conversion.second kota_library.temp /= #constant.20 kota_library.temp
            scoreboard players operation #time_unit_conversion.second kota_library.temp %= #constant.60 kota_library.temp

            # 分 → tick /20 /60
            scoreboard players operation #time_unit_conversion.minute kota_library.temp /= #constant.20 kota_library.temp
            scoreboard players operation #time_unit_conversion.minute kota_library.temp /= #constant.60 kota_library.temp

            # 時間 → tick /20 /60 /60
            scoreboard players operation #time_unit_conversion.hour kota_library.temp /= #constant.20 kota_library.temp
            scoreboard players operation #time_unit_conversion.hour kota_library.temp /= #constant.60 kota_library.temp
            scoreboard players operation #time_unit_conversion.hour kota_library.temp /= #constant.60 kota_library.temp

    # ストレージに出力
    