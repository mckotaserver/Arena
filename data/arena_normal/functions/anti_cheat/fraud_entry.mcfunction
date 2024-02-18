## 不正入場プレイヤー 強制送還
# 転送
tp @s @e[tag=Arena.Normal-Stage.Base_,limit=1]

# 演出
    # tellraw
    tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.fraud_entry"}]

    # playsound
    execute at @e[tag=Arena.Normal-Stage.Base_Normal,limit=1] run playsound entity.enderman.teleport master @s ~ ~ ~ 1 1

# リセット
function arena_normal:misc/player_reset
