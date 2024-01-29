## 終了 遅延後: 本処理
#> プレイヤー
# ステージリセット
function arena_normal:misc/stage_reset

#> 記録まわり   

    # 記録更新 → 特殊表示 & 鯖内通知
    $execute if data entity @s {data:{Arena:{isNewrecord:true}}} run tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.new_record_player","with":[{"text":"$(record)","color": "yellow"}]}]
    $execute if data entity @s {data:{Arena:{isNewrecord:true}}} run tellraw @a[tag=Arena.Flags-DisplayOthersAnnounce] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.new_record_server","with":[{"translate":"$(difficulty)"},{"translate":"$(mob_name)"},{"text":"$(record)","color": "yellow"}]}]

    # 本人 & 鯖内 tellraw
    $tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.clear_time","with":[{"text":"$(record)","color": "yellow"}]}]
    $tellraw @a[tag=Arena.Flags-DisplayOthersAnnounce] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.clear_announce","with":[{"translate":"$(difficulty)","color": "$(difficulty_color)"},{"translate":"$(mob_name)","color": "$(difficulty_color)"},{"translate":"kota-server.arena.game.arena","color": "$(difficulty_color)"},{"selector":"@a[tag=Arena.Normal-Stage.Player,distance=..48]","color": "yellow"}]}]

#> ロビーtp等
    # tp
    $tp @a[tag=Arena.Normal-Stage.Player,distance=..48] @e[tag=$(entered_lobby),limit=1]
    $tp @e[type=item,distance=..48] @e[tag=$(entered_lobby),limit=1]

    # 演出
    $execute at @e[tag=$(entered_lobby)] run playsound entity.enderman.teleport master @a[tag=Arena.Normal-Stage.Player,distance=..48] ~ ~ ~ 1 1
