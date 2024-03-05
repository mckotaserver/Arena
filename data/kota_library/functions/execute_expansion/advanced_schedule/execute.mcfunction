## Schedule Execute - コマンド実行
# マクロ代入
$$(command)

# 残りがあれば → キュー繰り処理
    # 実行済みのコマンドをキューから削除
    data remove entity @s data.kota_library.execute_expansion.advanced_schedule.executing.queue[0]

    # キューの次のコマンドを取得
    data modify entity @s data.kota_library.execute_expansion.advanced_schedule.executing.command set from entity @s data.kota_library.execute_expansion.advanced_schedule.executing.queue[0]

    # キューにデータがまだあれば再起
    execute if data entity @s data.kota_library.execute_expansion.advanced_schedule.executing.queue[0] run function kota_library:execute_expansion/advanced_schedule/execute with entity @s data.kota_library.execute_expansion.advanced_schedule.executing
    execute if data entity @s data.kota_library.execute_expansion.advanced_schedule.executing.queue[0] run return 0

# 実行予定データに残りなければ → 後始末
    # タグの除去
    execute unless data entity @s data.kota_library.execute_expansion.advanced_schedule.queue[0] run tag @s remove kota_library.advanced_schedule.waiting

    # データの削除
    execute unless data entity @s data.kota_library.execute_expansion.advanced_schedule.executing.queue[0] run data remove entity @s data.kota_library.execute_expansion.advanced_schedule.executing

