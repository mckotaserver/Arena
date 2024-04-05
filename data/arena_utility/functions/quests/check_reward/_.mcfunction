## クエスト報酬付与
#  playsound
playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2

# 目標と一致したなら処理
    data modify storage arena_quests:temp check_reward.main set from storage arena:quests daily
    data modify storage arena_quests:temp check_reward.main append from storage arena:quests weekly

    # マクロ引数の設定
    data modify storage arena_quests:temp check_reward.id set from storage arena_quests:temp check_reward.main[0].id
    data modify storage arena_quests:temp check_reward.type set from storage arena_quests:temp check_reward.main[0].type

    $data modify storage arena_quests:temp check_reward.player_name set value $(player_name)

    data modify storage arena_quests:temp check_reward.loot_table set from storage arena_quests:temp check_reward.main[0].reward.loot_table 

function arena_utility:quests/check_reward/loop with storage arena_quests:temp check_reward
