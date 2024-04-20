## プレイヤーデータの更新
# 仮データを作成
data modify storage arena_quests:temp player_data_update.out append value {id:"",current_value:0,objective:0,is_completed:false}

# id, objective をコピー
data modify storage arena_quests:temp player_data_update.out[-1].id set from storage arena_quests:temp player_data_update.original[0].id
data modify storage arena_quests:temp player_data_update.out[-1].objective set from storage arena_quests:temp player_data_update.original[0].objective

# 処理済みを削除
data remove storage arena_quests:temp player_data_update.original[0] 

# 再起できるなら再起
execute if data storage arena_quests:temp player_data_update.original[0] run function arena_utility:quests/player_data_update/loop
