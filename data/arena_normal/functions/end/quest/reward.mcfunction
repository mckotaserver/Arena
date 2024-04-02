## 達成判定
# 報酬の付与
    # loot_table
    $loot spawn ~ ~ ~ loot $(loot_table)

    # クエストポイント
    $execute store result score #quest_progress.reward.point arena.temp run data get storage arena:quests $(type)[{id:"$(id)"}].reward.point
    scoreboard players operation @s arena.quest_point += #quest_progress.reward.point arena.temp

    # アイテム
    $data modify storage kota_library: direct_item_give.in set from storage arena:quests $(type)[{id:"$(id)"}].reward.item 
    function kota_library:misc/direct_item_give

# クエスト達成: 1つ
    # tellraw
    $tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.quests.message.completed_single","with":[{"translate":"kota-server.arena.quests.$(id).name","hoverEvent":{"action": "show_text","contents": {"translate":"kota-server.arena.quests.$(id).description"}}}]}]

    # playsound
    playsound minecraft:entity.cat.ambient master @s ~ ~ ~ 1 1
    playsound block.note_block.pling master @s ~ ~ ~ 1 2

$execute if data storage arena:quests player_data[{name:"$(player_name)"}].$(type)[{is_completed:false}] run return 0

# クエスト達成: 全部
    # tellraw
    $tellraw @a[tag=arena.flags.display_others_announcement] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.quests.message.completed_all_$(type)","with":[{"text": "$(player_name)","color":"gold"}]}]

    # playsound
    execute as @a[tag=arena.flags.display_others_announcement] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2
    execute as @a[tag=arena.flags.display_others_announcement] at @s run playsound minecraft:block.smithing_table.use master @s ~ ~ ~ 1 1

    # 特別報酬: ポイント
    $execute store result score #quest_progress.reward.bonus_point arena.temp run data get storage arena:assets config.arena_quests.complete_bonus_point_$(type)
    scoreboard players operation @s arena.quest_point += #quest_progress.reward.bonus_point arena.temp
