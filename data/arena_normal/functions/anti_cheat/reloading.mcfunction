## アリーナプレイ中に再読み込み
# Tp
$tp @s @e[tag=$(entered_lobby),limit=1]

# 演出
    # tellraw
    tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.relogging"}]

    # playsound
    $execute at @e[tag=$(entered_lobby),limit=1] run playsound entity.enderman.teleport master @s ~ ~ ~ 1 1

# リセット
function arena_normal:misc/player_reset
