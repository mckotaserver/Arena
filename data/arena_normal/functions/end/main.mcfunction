## 終了 遅延後: 本処理
# データをストレージにコピー
data modify storage arena_normal:temp stage_data set from entity @s data.arena.stage_data

#> プレイヤー
    # 実績達成処理
    execute as @a[tag=arena.normal_stage.player,distance=..32] run function arena_normal:end/advancements
        
    # クエスト進捗判定
        # 必要なデータを取得
        data remove storage arena_quests:temp quest_testify.quests

        data modify storage arena_quests:temp quest_testify.quests set from storage arena:quests daily
        data modify storage arena_quests:temp quest_testify.quests append from storage arena:quests weekly

        tag @a[distance=..32,tag=arena.normal_stage.player] add arena.temp.quest_testify

        execute as @r[distance=..32,tag=arena.normal_stage.player] at @s run function arena_normal:end/quest/progress with storage arena_normal:temp stage_data

        # バックアップ
        data modify storage arena:quests backup set from storage arena:quests player_data

# ステージリセット
function arena_normal:misc/stage_reset

# タイマーまわりのリセット
scoreboard players reset @p[tag=arena.normal_stage.core_player] arena.timer
data modify entity @s data.arena.scheduler set value {}

#> 記録まわり
    # 記録更新 → 特殊表示 & 鯖内通知
    $execute if data entity @s {data:{arena:{is_new_record:true}}} run tellraw @a[tag=arena.normal_stage.player,distance=..32] [{"translate":"kota-server.arena.game.message.new_record_player","with":[{"text":"$(record)","color": "yellow"}]}]
    $execute if data entity @s {data:{arena:{is_new_record:true}}} run tellraw @a [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.new_record_server","with":[{"selector":"@p[tag=arena.normal_stage.core_player]","color": "gold"},{"translate":"$(difficulty)","color": "$(difficulty_color)"},{"translate":"$(mob_name)","color": "$(difficulty_color)"},{"translate":"kota-server.arena.game.arena","color": "$(difficulty_color)"},{"text":"$(record)","color": "yellow"}]}]

    execute if data entity @s {data:{arena:{is_new_record:true}}} as @a at @s run playsound minecraft:block.anvil.use master @s ~ ~ ~ 1 1.5

    # 本人 & 鯖内 tellraw
    $tellraw @a[tag=arena.normal_stage.player,distance=..32] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.clear_time","with":[{"text":"$(record)","color": "yellow"}]}]
    $tellraw @a[tag=arena.flags.display_others_announcement] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.clear_announce","with":[{"translate":"$(difficulty)","color": "$(difficulty_color)"},{"translate":"$(mob_name)","color": "$(difficulty_color)"},{"translate":"kota-server.arena.game.arena","color": "$(difficulty_color)"},{"selector":"@a[tag=arena.normal_stage.player,distance=..32]","color": "yellow"}]}]

    tellraw @a[tag=arena.normal_stage.player,distance=..32] [{"text": "アリーナに関しましてアンケートを実施中です。こちらからご回答いただけますと幸いです。","color": "gold"},{"text": "[Google Form]","color": "aqua","clickEvent": {"action": "open_url","value": "https://forms.gle/fZZjLcg5Xd1kG2j97"}}]

#> ロビーtp等
    # tp
    $tp @a[tag=arena.normal_stage.player,distance=..32] @e[tag=$(entered_lobby),limit=1]
    $tp @e[type=item,distance=..32] @e[tag=$(entered_lobby),limit=1]

    # 演出
    $execute at @e[tag=$(entered_lobby)] run playsound entity.enderman.teleport master @a[tag=arena.normal_stage.player,distance=..32] ~ ~ ~ 1 1
