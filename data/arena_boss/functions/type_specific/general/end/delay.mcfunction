## 終了処理 遅延
#> 通知
    # tellraw
    $tellraw @a[tag=Arena.Flags-DisplayOthersAnnounce] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.game.message.clear_announce","with":[{"selector":"@a[tag=Arena.Boss.Player,distance=..64]", "color": "gold"},{"translate":"$(MasterPrefix)"},{"translate":"$(Name)"}]}]
    
#> プレイヤー退場
    # playsound
    execute at @e[tag=Arena.Boss.Lobby,limit=1] run playsound entity.enderman.teleport master @a[tag=Arena.Boss.Player,distance=..64] ~ ~ ~ 1 1
    execute at @e[tag=Arena.Boss.Lobby,limit=1] run playsound entity.lightning_bolt.thunder master @a[tag=Arena.Boss.Player,distance=..64] ~ ~ ~ 1 2

    # particle
    execute at @e[tag=Arena.Boss.Lobby,limit=1] run particle dust_color_transition 0.75 0 0.75 0.75 100000000 1 100000000 ~ ~ ~ 0.5 1 0.5 1 40
    execute at @e[tag=Arena.Boss.Lobby,limit=1] run particle portal ~ ~ ~ 0.5 1 0.5 0.5 50

    # TP
    tp @a[tag=Arena.Boss.Player,distance=..64] @e[tag=Arena.Boss.Lobby,limit=1]

    # 一応タグ除去
    execute at @e[tag=Arena.Boss.Lobby,limit=1] run tag @a[tag=Arena.Boss.Player,distance=..4] remove Arena.Boss.Player
    