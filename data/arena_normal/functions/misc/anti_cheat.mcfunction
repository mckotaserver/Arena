## 強制送還
# 転送
tp @s @e[tag=Arena.Normal-Stage.Base_Lobby,limit=1]

# 演出
    # playsound
    execute at @e[tag=Arena.Normal-Stage.Base_Lobby,limit=1] run playsound entity.enderman.teleport master @s ~ ~ ~ 1 1

# リセット
function arena_normal:misc/player_reset
