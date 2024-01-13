## アリーナプレイ中に再読み込み
# 転送先
$execute if data entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.AnnounceDisplay run tag @e[tag=$(EnteredLobby)] add Arena.Temp-TpLobby
execute unless data entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.AnnounceDisplay run tag @e[tag=Arena.Normal-Stage.Lobby,sort=random,limit=1] add Arena.Temp-TpLobby
tp @s @e[tag=Arena.Temp-TpLobby,limit=1]

# 演出
    # tellraw
    tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.relogging"}]

    # playsound
    execute at @e[tag=Arena.Temp-TpLobby] run playsound entity.enderman.teleport master @s ~ ~ ~ 1 1

# Tp
tag @e[tag=Arena.Temp-TpLobby] remove Arena.Temp-TpLobby

# スコアリセット
scoreboard players reset @s Arena.LeaveGame