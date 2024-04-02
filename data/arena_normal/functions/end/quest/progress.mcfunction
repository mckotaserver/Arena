## クエストの進捗
# クエストのカウント要件を満たしているか判定
    # 確認中のクエストの条件データを取得
    data modify storage arena_quests:temp quest_testify.value_check.difficulty set from storage arena_normal:temp quest_testify.quests[0].requirement.difficulty
    data modify storage arena_quests:temp quest_testify.value_check.mob_type set from storage arena_normal:temp quest_testify.quests[0].requirement.mob_type
    data modify storage arena_quests:temp quest_testify.value_check.stage_type set from storage arena_normal:temp quest_testify.quests[0].requirement.player_count
    data modify storage arena_quests:temp quest_testify.value_check.player_count set from storage arena_normal:temp quest_testify.quests[0].requirement.player_count

    # 要件・クリア時の記録(tick)を取得
    execute store result score #quest_testify.record_max arena.temp run data get storage arena_normal:temp quest_testify.quests[0].requirement.record_max
    execute store result score #quest_testify.record arena.temp run data get entity @e[type=marker,sort=nearest,limit=1] data.arena.announcement_display.record

    # ひとつでも違う条件があれば判定失敗
    data modify storage arena_quests:temp quest_testify.test_passed set value true

    execute unless score #quest_testify.record_max arena.temp >= #quest_testify.record arena.temp run data modify storage arena_quests:temp quest_testify.test_passed set value false

    $execute unless data storage arena_quests:temp {quest_testify:{value_check:{difficulty:$(difficulty)}}} run data modify storage arena_quests:temp quest_testify.test_passed set value false
    $execute unless data storage arena_quests:temp {quest_testify:{value_check:{mob_type:$(mob_type)}}} run data modify storage arena_quests:temp quest_testify.test_passed set value false
    $execute unless data storage arena_quests:temp {quest_testify:{value_check:{stage_type:$(type)}}} run data modify storage arena_quests:temp quest_testify.test_passed set value false
    $execute unless data storage arena_quests:temp {quest_testify:{value_check:{player_count:$(player_count)}}} run data modify storage arena_quests:temp quest_testify.test_passed set value false

# 上記判定に成功したらカウント + 1
    # @sの名前を取得
    function kota_library:misc/get_player_name

    # マクロ引数を設定
    data modify storage arena_quests:temp quest_progress.type set from storage arena_normal:temp quest_testify.quests[0].type
    data modify storage arena_quests:temp quest_progress.id set from storage arena_normal:temp quest_testify.quests[0].id
    data modify storage arena_quests:temp quest_progress.player_name set from storage kota_library: get_player_name.out
    
    execute if data storage arena_quests:temp {quest_testify:{test_passed:true}} run function arena_normal:end/quest/progress_macro

# 次のクエストへ再起
data remove storage arena_normal:temp quest_testify.quests[0]
execute if data storage arena_normal:temp quest_testify.quests[0] run function arena_normal:end/quest/progress
