## クエストの進捗
# クエストのカウント要件を満たしているか判定
    # 確認中のクエストの条件データを取得
    data modify storage arena_quests:temp quest_testify.value_check set value {}

    data modify storage arena_quests:temp quest_testify.value_check.difficulty set from storage arena_quests:temp quest_testify.quests[0].requirement.difficulty
    data modify storage arena_quests:temp quest_testify.value_check.mob_type set from storage arena_quests:temp quest_testify.quests[0].requirement.mob_type
    data modify storage arena_quests:temp quest_testify.value_check.stage_type set from storage arena_quests:temp quest_testify.quests[0].requirement.stage_type
    data modify storage arena_quests:temp quest_testify.value_check.player_count set from storage arena_quests:temp quest_testify.quests[0].requirement.player_count
    data modify storage arena_quests:temp quest_testify.value_check.wave set from storage arena_quests:temp quest_testify.quests[0].requirement.wave

    # 個々の条件を判定; 一つでも違えば失敗判定
    data modify storage arena_quests:temp quest_testify.test_passed set value true

        # 要件: クリアタイム
        execute store result score #quest_testify.time_limit arena.temp run data get storage arena_quests:temp quest_testify.quests[0].requirement.time_limit
        execute store result score #quest_testify.record arena.temp run data get entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.announcement_display.record_tick

        execute if data storage arena_quests:temp quest_testify.quests[0].requirement.time_limit unless score #quest_testify.record arena.temp <= #quest_testify.time_limit arena.temp run data modify storage arena_quests:temp quest_testify.test_passed set value false

        # 要件: ステージ難易度
        $execute if data storage arena_quests:temp quest_testify.value_check.difficulty unless data storage arena_quests:temp {quest_testify:{value_check:{difficulty:$(difficulty)}}} run data modify storage arena_quests:temp quest_testify.test_passed set value false

        execute store result score #quest_testify.difficulty_min arena.temp run data get storage arena_quests:temp quest_testify.quests[0].requirement.difficulty
        $scoreboard players set #quest_testify.difficulty arena.temp $(difficulty)

        execute unless score #quest_testify.difficulty arena.temp >= #quest_testify.difficulty_min arena.temp run data modify storage arena_quests:temp quest_testify.test_passed set value false

        # 要件: その他(種類, ステージタイプ, ウェーブ, 人数)    
        $execute if data storage arena_quests:temp quest_testify.value_check.mob_type unless data storage arena_quests:temp {quest_testify:{value_check:{mob_type:$(mob_type)}}} run data modify storage arena_quests:temp quest_testify.test_passed set value false
        $execute if data storage arena_quests:temp quest_testify.value_check.stage_type unless data storage arena_quests:temp {quest_testify:{value_check:{stage_type:$(type)}}} run data modify storage arena_quests:temp quest_testify.test_passed set value false
        $execute if data storage arena_quests:temp quest_testify.value_check.wave unless data storage arena_quests:temp {quest_testify:{value_check:{wave:$(wave)}}} run data modify storage arena_quests:temp quest_testify.test_passed set value false
        $execute if data storage arena_quests:temp quest_testify.value_check.player_count unless data storage arena_quests:temp {quest_testify:{value_check:{player_count:$(player_count)}}} run data modify storage arena_quests:temp quest_testify.test_passed set value false

# 上記判定に成功したらカウント + 1
    # @sの名前を取得
    function kota_library:misc/get_player_name

    # マクロ引数を設定
    data modify storage arena_quests:temp quest_progress.type set from storage arena_quests:temp quest_testify.quests[0].type
    data modify storage arena_quests:temp quest_progress.id set from storage arena_quests:temp quest_testify.quests[0].id
    data modify storage arena_quests:temp quest_progress.player_name set from storage kota_library: get_player_name.out

    execute if data storage arena_quests:temp {quest_testify:{test_passed:true}} run function arena_normal:end/quest/check_passed with storage arena_quests:temp quest_progress

# 次のクエストへ再起
data remove storage arena_quests:temp quest_testify.quests[0]
execute if data storage arena_quests:temp quest_testify.quests[0] run function arena_normal:end/quest/progress_check with storage arena_normal:temp stage_data

# プレイヤーの処理終了 → ほかのプレイヤーへ
execute unless data storage arena_quests:temp quest_testify.quests[0] run tag @s remove arena.temp.quest_testify
execute unless data storage arena_quests:temp quest_testify.quests[0] as @r[tag=arena.temp.quest_testify,distance=..32] at @s run function arena_normal:end/quest/progress_check with storage arena_normal:temp stage_data

