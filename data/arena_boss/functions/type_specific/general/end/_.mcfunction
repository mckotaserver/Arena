## 終了処理
# プレイヤー通知
    # tellraw
    tellraw @a[tag=arena.boss.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.game.message.end_announcenemnt"}]

    # playsound
    execute as @a[tag=arena.boss.Player,distance=..48] at @s run playsound entity.wither.ambient master @s ~ ~ ~ 1 0.75

# 記録関連処理
    # # クリア記録
    # function arena_normal:recording/_

    # data modify entity @s data.Arena.announcement_display.Record set from storage arena:temp Recording.Time.DisplayData
    # execute if data entity @s {data:{Arena:{StageData:{difficulty:2}}}} if data storage arena:temp {Recording:{Insertion:{conditionMatched:true,counter:0}}} run data modify entity @s data.Arena.isNewRecord set value true

    # # 統計
    # data modify storage arena:temp Stats.difficulty set from entity @s data.Arena.StageData.difficulty
    # data modify storage arena:temp Stats.mob_type set from entity @s data.Arena.StageData.mob_type

    #     # ヘッド召喚前準備
    #     setblock ~ -64 ~ bedrock replace
    #     setblock ~ -64 ~ barrel replace

    # execute as @r[tag=arena.boss.Player,distance=..48] at @s run function arena_normal:recording/stats/_
    # tag @a[tag=arena.Temp-StatsRegistered] remove Arena.Temp-StatsRegistered

    #     # ヘッド召喚後処理
    #     setblock ~ -64 ~ bedrock replace

#> 遅延処理
# タイマーセット
    # Current + 300t
    execute store result score #EndTick Arena.Temp run time query gametime
    scoreboard players add #EndTick Arena.Temp 300

    execute store result entity @s data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp

    # マクロ引数
    data modify entity @s data.Arena.Timer.Function set value "arena_boss:type_specific/general/end/delay"
    data modify entity @s data.Arena.Timer.With set value "with entity @s data.Arena.boss.StageData.DisplayData.TranslationKey"

    # マスターかな
    execute if data entity @s {data:{Arena:{boss:{StageData:{isMaster:false}}}}} run data modify entity @s data.Arena.boss.StageData.DisplayData.TranslationKey.MasterPrefix set value ""
    execute if data entity @s {data:{Arena:{boss:{StageData:{isMaster:true}}}}} run data modify entity @s data.Arena.boss.StageData.DisplayData.TranslationKey.MasterPrefix set value "kota-server.arena.boss.master_prefix"

schedule function arena_boss:misc/timer/delay 300t

