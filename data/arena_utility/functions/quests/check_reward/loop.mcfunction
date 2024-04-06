## クエスト報酬付与
# 目標と一致したなら処理
    # 現在値, 目標値を取得
    $execute store result score #check_reward.current_value arena.temp run data get storage arena:quests player_data[{name:$(player_name)}].$(type)[{id:$(id)}].current_value
    $execute store result score #check_reward.objective arena.temp run data get storage arena:quests player_data[{name:$(player_name)}].$(type)[{id:$(id)}].objective

    $data modify storage arena_quests:temp check_reward.enable_progress set from storage arena:quests $(type)[{id:$(id)}].enable_progress
    execute if data storage arena_quests:temp {check_reward:{enable_progress:false}} run scoreboard players set #check_reward.objective arena.temp 1

    # 
    data modify storage arena_quests:temp check_reward.type set from storage arena_quests:temp check_reward.main[0].type
    $data modify storage arena_quests:temp check_reward.quest_completed set from storage arena:quests player_data[{name:"$(player_name)"}].$(type)[{id:$(id)}].is_completed

    # 条件適せば報酬付与
    execute if score #check_reward.current_value arena.temp = #check_reward.objective arena.temp if data storage arena_quests:temp {check_reward:{quest_completed:false}} run function arena_utility:quests/check_reward/rewarding with storage arena_quests:temp check_reward

    # マクロ引数の設定
    data remove storage arena_quests:temp check_reward.main[0]

    data modify storage arena_quests:temp check_reward.id set from storage arena_quests:temp check_reward.main[0].id
    data modify storage arena_quests:temp check_reward.type set from storage arena_quests:temp check_reward.main[0].type

    $data modify storage arena_quests:temp check_reward.player_name set value $(player_name)

    data modify storage arena_quests:temp check_reward.loot_table set from storage arena_quests:temp check_reward.main[0].reward.loot_table

execute if data storage arena_quests:temp check_reward.main[0] run function arena_utility:quests/check_reward/loop with storage arena_quests:temp check_reward
