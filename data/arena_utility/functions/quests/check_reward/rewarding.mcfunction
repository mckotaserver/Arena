## 達成判定
# フラグ管理
$data modify storage arena:quests player_data[{name:"$(player_name)"}].$(type)[{id:$(id)}].is_completed set value true
data modify storage arena_quests:temp check_reward.succeeded set value true

# 報酬の付与
    # loot_table
    $loot spawn ~ ~ ~ loot $(loot_table)

    # クエストポイント
    execute store result score #quest_progress.reward.point arena.temp run data get storage arena_quests:temp check_reward.main[0].reward.point
    scoreboard players operation @s arena.quest_point += #quest_progress.reward.point arena.temp

    # アイテム
    data modify storage kota_library: direct_item_give.in set from storage arena_quests:temp check_reward.main[0].reward.item 

    function kota_library:misc/direct_item_give

    # money
    data modify storage kota_library: money_give.in set from storage arena_quests:temp check_reward.main[0].reward.money

    function kota_library:misc/money_give with storage kota_library: money_give.in
    
# クエスト達成: 1つ
    # tellraw
    $tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.quests.message.completed_single","with":[{"translate":"kota-server.arena.quests.$(id).name","hoverEvent":{"action": "show_text","contents": {"translate":"kota-server.arena.quests.$(id).description"}}}]}]

    # playsound
    playsound minecraft:entity.cat.ambient master @s ~ ~ ~ 1 1
    playsound block.note_block.pling master @s ~ ~ ~ 1 2

    # 実績
    $function arena_normal:misc/advancements_grant {path:"quests/first_complete_$(type)"}
    
# クエスト達成: 全部
$data modify storage arena_quests:temp check_reward.quest_group_status set from storage arena:quests player_data[{name:"$(player_name)"}].$(type)
execute if data storage arena_quests:temp {check_reward:{quest_group_status:[{is_completed:false}]}} run return 0

    # tellraw
    $tellraw @a[tag=arena.flags.display_others_announcement] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.quests.message.completed_all_$(type)","with":[{"text": "$(player_name)","color":"gold"}]}]

    # playsound
    execute as @a[tag=arena.flags.display_others_announcement] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2
    execute as @a[tag=arena.flags.display_others_announcement] at @s run playsound minecraft:block.smithing_table.use master @s ~ ~ ~ 1 1

    # 特別報酬: ポイント
    $execute store result score #quest_progress.reward.bonus_point arena.temp run data get storage arena:assets config.arena_quests.complete_bonus_point_$(type)
    scoreboard players operation @s arena.quest_point += #quest_progress.reward.bonus_point arena.temp

    # 実績
    $function arena_normal:misc/advancements_grant {path:"quests/first_all_complete_$(type)"}
