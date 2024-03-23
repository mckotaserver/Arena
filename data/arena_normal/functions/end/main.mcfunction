## 終了 遅延後: 本処理
#> プレイヤー
    # 実績達成処理
        # データをストレージにコピー
        data modify storage arena_normal:temp stage_data set from entity @s data.Arena.stage_data

        # first_clear
        execute if data storage arena_normal:temp {stage_data:{difficulty:0}} as @a[tag=arena.normal-stage.Player,distance=..48] run function arena_normal:misc/advancements_grant {path:"first_clear/easy"}
        execute if data storage arena_normal:temp {stage_data:{difficulty:1}} as @a[tag=arena.normal-stage.Player,distance=..48] run function arena_normal:misc/advancements_grant {path:"first_clear/normal"}
        execute if data storage arena_normal:temp {stage_data:{difficulty:2}} as @a[tag=arena.normal-stage.Player,distance=..48] run function arena_normal:misc/advancements_grant {path:"first_clear/hard"}

        # lonesome_challenge
        execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:0}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/zombie"}
        execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:1}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/skeleton"}
        execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:2}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/blaze"}
        execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:3}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/spider"}
        execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:4}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/slime"}
        execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:5}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/creeper"}

# ステージリセット
function arena_normal:misc/stage_reset

#> 記録まわり   

    # 記録更新 → 特殊表示 & 鯖内通知
    $execute if data entity @s {data:{Arena:{isNewrecord:true}}} run tellraw @a[tag=arena.normal-stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.new_record_player","with":[{"text":"$(record)","color": "yellow"}]}]
    $execute if data entity @s {data:{Arena:{isNewrecord:true}}} run tellraw @a[tag=arena.Flags-DisplayOthersAnnounce] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.new_record_server","with":[{"translate":"$(difficulty)"},{"translate":"$(mob_name)"},{"text":"$(record)","color": "yellow"}]}]

    # 本人 & 鯖内 tellraw
    $tellraw @a[tag=arena.normal-stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.clear_time","with":[{"text":"$(record)","color": "yellow"}]}]
    $tellraw @a[tag=arena.Flags-DisplayOthersAnnounce] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.clear_announce","with":[{"translate":"$(difficulty)","color": "$(difficulty_color)"},{"translate":"$(mob_name)","color": "$(difficulty_color)"},{"translate":"kota-server.arena.game.arena","color": "$(difficulty_color)"},{"selector":"@a[tag=arena.normal-stage.Player,distance=..48]","color": "yellow"}]}]

#> ロビーtp等
    # tp
    $tp @a[tag=arena.normal-stage.Player,distance=..48] @e[tag=$(entered_lobby),limit=1]
    $tp @e[type=item,distance=..48] @e[tag=$(entered_lobby),limit=1]

    # 演出
    $execute at @e[tag=$(entered_lobby)] run playsound entity.enderman.teleport master @a[tag=arena.normal-stage.Player,distance=..48] ~ ~ ~ 1 1
