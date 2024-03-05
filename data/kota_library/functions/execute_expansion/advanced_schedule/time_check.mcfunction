## Schedule Execute
# 処理すべきデータがない → 処理中断
$execute unless data entity @s data.kota_library.execute_expansion.advanced_schedule.queue[{execution_time:$(current_time)}] run return 0

# 処理中スケジュールの管理
    # 中身をリセット
    data modify entity @s data.kota_library.execute_expansion.advanced_schedule.executing set value {}

    # キューから実行時刻に達したもののデータをコピー
    $execute if data entity @s data.kota_library.execute_expansion.advanced_schedule.queue[{execution_time:$(current_time)}] run data modify entity @s data.kota_library.execute_expansion.advanced_schedule.executing set from entity @s data.kota_library.execute_expansion.advanced_schedule.queue[{execution_time:$(current_time)}]

    # 処理済みのデータをキューから削除
    $data remove entity @s data.kota_library.execute_expansion.advanced_schedule.queue[{execution_time:$(current_time)}]

# 実行
    # 実行前処理; キューの最初のコマンドを取得
    data modify entity @s data.kota_library.execute_expansion.advanced_schedule.executing.command set from entity @s data.kota_library.execute_expansion.advanced_schedule.executing.queue[0]

    # function呼び出し
    function kota_library:execute_expansion/advanced_schedule/execute with entity @s data.kota_library.execute_expansion.advanced_schedule.executing
