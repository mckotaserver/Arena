## 終了処理
# タイマー関連処理
scoreboard players reset @p[tag=arena.normal_stage.core_player] arena.timer

# 最後処理の予約
execute if entity @a[tag=arena.normal_stage.player,tag=!arena.flags.count_skip,distance=..48] run scoreboard players set @p[tag=arena.normal_stage.core_player] arena.timer 300
execute unless entity @a[tag=arena.normal_stage.player,tag=!arena.flags.count_skip,distance=..48] run scoreboard players set @p[tag=arena.normal_stage.core_player] arena.timer 100

data modify entity @s data.arena.scheduler.command set value "function arena_normal:end/main with entity @s data.arena.announcement_display"

# プレイヤー通知
    # tellraw
    execute store result storage arena_normal:temp misc.tellraw.wave_break int 0.05 run scoreboard players get @p[tag=arena.normal_stage.core_player] arena.timer
    tellraw @a[tag=arena.normal_stage.player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.end_announce","with":[{"nbt":"misc.tellraw.wave_break","storage":"arena_normal:temp","color": "yellow","underlined": true}]}]

    # playsound
    execute as @a[tag=arena.normal_stage.player,distance=..48] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 2
    execute as @a[tag=arena.normal_stage.player,distance=..48] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2

# 記録関連処理
    # クリア記録
    function arena_normal:recording/_

    data modify entity @s data.arena.announcement_display.record set from storage arena_normal:temp recording.time.display_data
    data modify entity @s data.arena.announcement_display.player_name set from storage arena_normal:temp recording.compound.Name

    execute if data entity @s {data:{arena:{stage_data:{difficulty:2}}}} if data storage arena_normal:temp {recording:{insertion:{conditionMatched:true,counter:0}}} run data modify entity @s data.arena.is_new_record set value true

    # 統計
    data modify storage arena_normal:temp stats.difficulty set from entity @s data.arena.stage_data.difficulty
    data modify storage arena_normal:temp stats.mob_type set from entity @s data.arena.stage_data.mob_type

        # ヘッド召喚前準備
        setblock ~ -64 ~ bedrock replace
        setblock ~ -64 ~ barrel replace

    execute as @r[tag=arena.normal_stage.player,distance=..48] at @s run function arena_normal:recording/stats/_
    tag @a[tag=arena.temp.stats_registered] remove arena.temp.stats_registered

        # ヘッド召喚後処理
        setblock ~ -64 ~ bedrock replace

# 終了時tellrawへの設定用データ
    # mob_name
    $data modify entity @s data.arena.announcement_display.mob_name set from storage arena:assets stage_data[$(mob_type)].display.translation_key

    # difficulty
    $data modify entity @s data.arena.announcement_display.difficulty set from storage arena:assets stage_difficulty[$(difficulty)].display.translation_key
    $data modify entity @s data.arena.announcement_display.difficulty_color set from storage arena:assets stage_difficulty[$(difficulty)].display.color

# チケットの配布
$execute store result score #reward.ticket_count arena.temp run data get storage arena:assets stage_data[$(mob_type)].reward[$(difficulty)]
 
$execute as @a[tag=arena.normal_stage.player,distance=..48] at @s run function arena_normal:end/loot_macro with storage arena:assets stage_difficulty[$(difficulty)]



