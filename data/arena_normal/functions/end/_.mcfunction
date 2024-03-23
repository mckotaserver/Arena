## 終了処理
# タイマー関連処理
scoreboard players reset @p[tag=arena.normal-stage.Core-Player] Arena.Timer
data modify entity @s data.Arena.status set value idle

# プレイヤー通知
    # tellraw
    tellraw @a[tag=arena.normal-stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.end_announce"}]

    # playsound
    execute as @a[tag=arena.normal-stage.Player,distance=..48] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 2
    execute as @a[tag=arena.normal-stage.Player,distance=..48] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2

# 記録関連処理
    # クリア記録
    function arena_normal:recording/_

    data modify entity @s data.Arena.announcement_display.record set from storage arena_normal:temp Recording.Time.DisplayData

    execute if data entity @s {data:{Arena:{stage_data:{difficulty:2}}}} if data storage arena_normal:temp {Recording:{Insertion:{conditionMatched:true,counter:0}}} run data modify entity @s data.Arena.isNewRecord set value true

    # 統計
    data modify storage arena_normal:temp Stats.difficulty set from entity @s data.Arena.stage_data.difficulty
    data modify storage arena_normal:temp Stats.mob_type set from entity @s data.Arena.stage_data.mob_type

        # ヘッド召喚前準備
        setblock ~ -64 ~ bedrock replace
        setblock ~ -64 ~ barrel replace

    execute as @r[tag=arena.normal-stage.Player,distance=..48] at @s run function arena_normal:recording/stats/_
    tag @a[tag=arena.Temp-StatsRegistered] remove Arena.Temp-StatsRegistered

        # ヘッド召喚後処理
        setblock ~ -64 ~ bedrock replace

# 終了時tellrawへの設定用データ
    # mob_name
    $data modify entity @s data.Arena.announcement_display.mob_name set from storage arena:assets stage_data[$(mob_type)].display.translation_key

    # difficulty
    $data modify entity @s data.Arena.announcement_display.difficulty set from storage arena:assets stage_difficulty[$(difficulty)].display.translation_key
    $data modify entity @s data.Arena.announcement_display.difficulty_color set from storage arena:assets stage_difficulty[$(difficulty)].display.color

scoreboard players set @p[tag=arena.normal-stage.Core-Player] Arena.Timer 300
data modify entity @s data.status set value "pre_end"

function kota_library:execute_expansion/advanced_schedule/_ {selector:"@e[tag=arena.normal-stage.Stage-Core]",command:"execute at @s run function arena_normal:end/main with entity @s data.Arena.announcement_display",schedule:300}

# チケットの配布
$execute store result score #Reward.TicketCount Arena.Temp run data get storage arena:assets stage_data[$(mob_type)].reward[$(difficulty)]
 
$execute as @a[tag=arena.normal-stage.Player,distance=..48] at @s run function arena_normal:end/loot_macro with storage arena:assets stage_difficulty[$(difficulty)]



