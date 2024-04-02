# データが存在しなければ新規に作成
    # 各データが存在するか確認
    $execute store result storage arena_quests:temp quest_testify.player_data_exist byte 1 if data storage arena:quests player_data[{name:"$(player_name)"}] 

    $execute store result storage arena_quests:temp quest_testify.quest_data_exist_daily byte 1 if data storage arena:quests player_data[{name:"$(player_name)"}].daily
    $execute store result storage arena_quests:temp quest_testify.quest_data_exist_weekly byte 1 if data storage arena:quests player_data[{name:"$(player_name)"}].weekly

    # プレイヤーデータの生成
    $execute if data storage arena_quests:temp {quest_testify:{player_data_exist:false}} run data modify storage arena_quests:temp quest_data_append.data set value {name:"$(player_name)",daily:[],weekly:[]}

    # デイリーの再生成
    data modify storage arena_quests:temp quest_data_append set value {}

    data modify storage arena_quests:temp quest_data_append.macro.type set value "daily"
    data modify storage arena_quests:temp quest_data_append.macro.index set value 0

    data modify storage arena_quests:temp quest_data_append.original set from storage arena:quests daily

    execute if data storage arena_quests:temp {quest_testify:{quest_data_exist_daily:false}} run function arena_utility:quests/data_append with storage arena_quests:temp quest_data_append.macro

    # ウィークリーの再生成
    data modify storage arena_quests:temp quest_data_append.macro.type set value "weekly"
    data modify storage arena_quests:temp quest_data_append.macro.index set value 0

    data modify storage arena_quests:temp quest_data_append.original set from storage arena:quests weekly

    execute if data storage arena_quests:temp {quest_testify:{quest_data_exist_weekly:false}} run function arena_utility:quests/data_append with storage arena_quests:temp quest_data_append.macro

    # 新規作成 or データ更新
    execute if data storage arena_quests:temp {quest_testify:{player_data_exist:false}} run data modify storage arena:quests player_data append from storage arena_quests:temp quest_data_append.data

    $execute if data storage arena_quests:temp {quest_testify:{quest_data_exist_daily:false}} run data modify storage arena:quests player_data[{name:"$(player_name)"}].daily set from storage arena_quests:temp quest_data_append.data.daily
    $execute if data storage arena_quests:temp {quest_testify:{quest_data_exist_weekly:false}} run data modify storage arena:quests player_data[{name:"$(player_name)"}].weekly set from storage arena_quests:temp quest_data_append.data.weekly

# 達成したか判定
$data modify storage arena_quests:temp quest_testify.is_completed set from storage arena:quests player_data[{name:"$(player_name)"}].$(type)[{id:"$(id)"}].is_completed

# # 1 加算
scoreboard players set #quest_progress.current_value arena.temp -1

$execute if data storage arena_quests:temp {quest_testify:{is_completed:false}} store result score #quest_progress.current_value arena.temp run data get storage arena:quests player_data[{name:"$(player_name)"}].$(type)[{id:"$(id)"}].current_value
$execute if data storage arena_quests:temp {quest_testify:{is_completed:false}} store result storage arena:quests player_data[{name:"$(player_name)"}].$(type)[{id:"$(id)"}].current_value int 1 run scoreboard players add #quest_progress.current_value arena.temp 1

# 達成判定
    execute if data storage arena_quests:temp {quest_testify:{is_completed:true}} run return 0

    # 目標と一致したなら処理
    $execute store result score #quest_progress.objective arena.temp run data get storage arena:quests $(type)[{id:"$(id)"}].requirement.count

    # マクロ引数の設定
    $data modify storage arena_quests:temp quest_progress.reward_give.type set value $(type)
    $data modify storage arena_quests:temp quest_progress.reward_give.id set value $(id)
    $data modify storage arena_quests:temp quest_progress.reward_give.player_name set value $(player_name)

    $data modify storage arena_quests:temp quest_progress.reward_give.loot_table set from storage arena:quests $(type)[{id:"$(id)"}].reward.loot_table 

    execute if score #quest_progress.current_value arena.temp = #quest_progress.objective arena.temp run function arena_normal:end/quest/reward with storage arena_quests:temp quest_progress.reward_give
