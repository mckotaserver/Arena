# 達成したか判定
$data modify storage arena_quests:temp quest_testify.is_completed set from storage arena:quests player_data[{name:"$(player_name)"}].$(type)[{id:"$(id)"}].is_completed

# 1 加算
scoreboard players set #quest_progress.current_value arena.temp -1

$execute if data storage arena_quests:temp {quest_testify:{is_completed:false}} store result score #quest_progress.current_value arena.temp run data get storage arena:quests player_data[{name:"$(player_name)"}].$(type)[{id:"$(id)"}].current_value
$execute if data storage arena_quests:temp {quest_testify:{is_completed:false}} store result storage arena:quests player_data[{name:"$(player_name)"}].$(type)[{id:"$(id)"}].current_value int 1 run scoreboard players add #quest_progress.current_value arena.temp 1

# 達成判定
    execute if data storage arena_quests:temp {quest_testify:{is_completed:true}} run return 0

    # 目標と一致したなら処理
    $execute store result score #quest_progress.object arena.temp run data get storage arena:quests $(type)[{id:"$(id)"}].requirement.count

    # マクロ引数の設定
    $data modify storage arena_quests:temp quest_progress.reward_give.type set value $(type)
    $data modify storage arena_quests:temp quest_progress.reward_give.id set value $(id)
    $data modify storage arena_quests:temp quest_progress.reward_give.player_name set value $(player_name)

    $data modify storage arena_quests:temp quest_progress.reward_give.loot_table set from storage arena:quests $(type)[{id:"$(id)"}].reward.loot_table 

    execute if score #quest_progress.current_value arena.temp = #quest_progress.object arena.temp run function arena_normal:end/quest/reward with storage arena_quests:temp quest_progress.reward_give

