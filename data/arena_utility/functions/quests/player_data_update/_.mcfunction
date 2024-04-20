## クエスト: 初期データの作成
# type = daily / weekly でなければ中断
$data modify storage arena_quests:temp player_data_update.argument_check set value "$(type)"
execute unless data storage arena_quests:temp {player_data_update:{argument_check:"daily"}} unless data storage arena_quests:temp {player_data_update:{argument_check:"weekly"}} run return 0

# クエスト一覧からデータをコピー
$data modify storage arena_quests:temp player_data_update.original set from storage arena:quests $(type)

# 出力をリセット
data modify storage arena_quests:temp player_data_update.out set value []

# 再帰処理して初期状態のデータを作成
function arena_utility:quests/player_data_update/loop
