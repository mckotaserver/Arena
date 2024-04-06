## クエスト報酬付与
#  playsound


# 目標と一致したなら処理
    data modify storage arena_quests:temp check_reward.main set from storage arena:quests daily
    data modify storage arena_quests:temp check_reward.main append from storage arena:quests weekly

    # マクロ引数の設定
    data modify storage arena_quests:temp check_reward.id set from storage arena_quests:temp check_reward.main[0].id
    data modify storage arena_quests:temp check_reward.type set from storage arena_quests:temp check_reward.main[0].type

    $data modify storage arena_quests:temp check_reward.player_name set value $(player_name)

    data modify storage arena_quests:temp check_reward.loot_table set from storage arena_quests:temp check_reward.main[0].reward.loot_table 

data modify storage arena_quests:temp check_reward.succeeded set value false
function arena_utility:quests/check_reward/loop with storage arena_quests:temp check_reward

# 受け取りの有無によって分岐
    # なし
    execute if data storage arena_quests:temp {check_reward:{succeeded:false}} run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.quests.message.no_reward_available"}]
    execute if data storage arena_quests:temp {check_reward:{succeeded:false}} run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 0.75

    # あり
    execute if data storage arena_quests:temp {check_reward:{succeeded:true}} run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2
