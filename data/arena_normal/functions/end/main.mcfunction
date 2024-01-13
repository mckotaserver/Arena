## 終了 遅延後: 本処理
#> プレイヤー
# ステージリセット
function arena_normal:misc/stage_reset

#> 記録まわり   

    # 記録更新 → 特殊表示 & 鯖内通知
    $execute if data entity @s {data:{Arena:{isNewRecord:true}}} run tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.new_record_player","with":[{"text":"$(Record)","color": "yellow"}]}]
    $execute if data entity @s {data:{Arena:{isNewRecord:true}}} run tellraw @a[tag=Arena.Flags-DisplayOthersAnnounce] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.new_record_server","with":[{"translate":"$(Difficulty)"},{"translate":"$(MobName)"},{"text":"$(Record)","color": "yellow"}]}]

    # 本人 & 鯖内 tellraw
    $tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.clear_time","with":[{"text":"$(Record)","color": "yellow"}]}]
    $tellraw @a[tag=Arena.Flags-DisplayOthersAnnounce] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.clear_announce","with":[{"translate":"$(Difficulty)","color": "$(DifficultyColor)"},{"translate":"$(MobName)","color": "$(DifficultyColor)"},{"selector":"@a[tag=Arena.Normal-Stage.Player,distance=..48]","color": "yellow"}]}]

#> ロビーtp等
    # tp
    $tp @a[tag=Arena.Normal-Stage.Player,distance=..48] @e[tag=$(EnteredLobby),limit=1]
    $tp @e[type=item,distance=..48] @e[tag=$(EnteredLobby),limit=1]

    # 演出
    $execute at @e[tag=$(EnteredLobby)] run playsound entity.enderman.teleport master @a[tag=Arena.Normal-Stage.Player,distance=..48] ~ ~ ~ 1 1
