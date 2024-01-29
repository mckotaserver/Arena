## 終了処理
# プレイヤー通知
    # tellraw
    tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.end_announce"}]

    # playsound
    execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 2
    execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2

# 記録関連処理
    # クリア記録
    function arena_normal:recording/_

    data modify entity @s data.Arena.announcement_display.record set from storage arena:temp Recording.Time.DisplayData

    execute if data entity @s {data:{Arena:{StageData:{difficulty:2}}}} if data storage arena:temp {Recording:{Insertion:{conditionMatched:true,Counter:0}}} run data modify entity @s data.Arena.isNewRecord set value true

    # 統計
    data modify storage arena:temp Stats.difficulty set from entity @s data.Arena.StageData.difficulty
    data modify storage arena:temp Stats.MobType set from entity @s data.Arena.StageData.MobType

        # ヘッド召喚前準備
        setblock ~ -64 ~ bedrock replace
        setblock ~ -64 ~ barrel replace

    execute as @r[tag=Arena.Normal-Stage.Player,distance=..48] at @s run function arena_normal:recording/stats/_
    tag @a[tag=Arena.Temp-StatsRegistered] remove Arena.Temp-StatsRegistered

        # ヘッド召喚後処理
        setblock ~ -64 ~ bedrock replace

# クリア判定を抑制
data modify entity @s data.Arena.Timer.WaveWaiting set value true

# 終了時tellrawへの設定用データ
    # mob_name
    $data modify entity @s data.Arena.announcement_display.mob_name set from storage arena:assets stage_data[$(MobType)].display.translation_key

    # difficulty
    $data modify entity @s data.Arena.announcement_display.difficulty set from storage arena:assets stage_difficulty[$(difficulty)].display.translation_key
    $data modify entity @s data.Arena.announcement_display.difficulty_color set from storage arena:assets stage_difficulty[$(difficulty)].display.color

# タイマー関連処理
execute store result score #EndTick Arena.Temp run time query gametime
scoreboard players add #EndTick Arena.Temp 300

execute store result entity @s data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp
schedule function arena_normal:end/delay 300t

# チケットの配布
$execute store result score #Reward.TicketCount Arena.Temp run data get storage arena:assets stage_data[$(MobType)].reward[$(difficulty)]
 
$execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run function arena_normal:end/loot_macro with storage arena:assets stage_difficulty[$(difficulty)]



