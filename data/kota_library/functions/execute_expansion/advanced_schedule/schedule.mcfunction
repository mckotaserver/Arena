## Schedule Execute
# 一時スコアボードの定義
scoreboard objectives add kota_library.temp dummy

# 現在時刻(s)の計算
    # 現在時刻(t)を取得
    execute store result score #advanced_schedule.current_time kota_library.temp in minecraft:overworld run time query gametime

    # 20で除算して秒単位に変換
    execute store result storage kota_library:temp execute_expansion.advanced_schedule.current_time int 1 run scoreboard players operation #advanced_schedule.current_time kota_library.temp /= #20 Constant

# 実行対象のマーカーに時刻チェックを実行
execute as @e[tag=kota_library.execute_expansion.advanced_schedule.waiting] at @s run function kota_library:execute_expansion/advanced_schedule/time_check with storage kota_library:temp execute_expansion.advanced_schedule

# 一時スコアボードの削除
scoreboard objectives remove kota_library.temp 
