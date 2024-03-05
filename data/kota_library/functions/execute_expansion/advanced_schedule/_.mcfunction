## Schedule Execute
# マーカーであるか確認
$execute $(selector) unless entity @s[type=marker] run return 0

# 一時スコアボードの定義
    # 計算用スコアボード
    scoreboard objectives add kota_library.temp dummy

#> 前処理
    # 時刻設定
        # 現在の時刻(t)を取得
        execute store result score #advanced_schedule.execution_time kota_library.temp in minecraft:overworld run time query gametime

        # スケジュール分を加算
        $scoreboard players add #advanced_schedule.execution_time kota_library.temp $(schedule)

        # 20で除算して秒単位に変換
        scoreboard players operation #advanced_schedule.execution_time kota_library.temp /= #20 Constant

    # データ更新 listで管理
        # append
        $execute $(selector) run data modify entity @s data.kota_library.execute_expansion.advanced_schedule.queue append value {queue:$(command),execution_time:-1}

        # 実行時刻
        $execute $(selector) store result entity @s data.kota_library.execute_expansion.advanced_schedule.queue[-1].execution_time int 1 run scoreboard players get #advanced_schedule.execution_time kota_library.temp

        # 簡単のためのタグを追加
        $execute $(selector) run tag @s add kota_library.execute_expansion.advanced_schedule.waiting

#> schedule function
    # 関数呼び出し

    $schedule function kota_library:execute_expansion/advanced_schedule/schedule $(schedule)t
    
#> 後処理
    # スコアボードの削除
    scoreboard objectives remove kota_library.temp
