## TICK.
# ステージから離れたプレイヤー
execute as @a[tag=Arena.Normal-Stage.Player] at @s unless entity @e[tag=Arena.Normal-Stage.Stage-Core,distance=..48] run function arena_normal:misc/player_reset

# 代表プレイヤー選出
execute as @a[tag=Arena.Normal-Stage.Player,tag=!Arena.Normal-Stage.Core-Player] unless entity @a[tag=Arena.Normal-Stage.Core-Player,distance=..48] at @s run tag @r[tag=Arena.Normal-Stage.Player,distance=..48] add Arena.Normal-Stage.Core-Player

    # モブクリア判定
    execute at @a[tag=Arena.Normal-Stage.Core-Player] as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{Spawning:{Counter:0},Timer:{WaveWaiting:false}}}} unless entity @e[tag=Arena.Normal-Stage.Mob,distance=..48] run function arena_normal:wave_process/mob_cleared

    # スライム: 分裂後を認識
    execute at @a[tag=Arena.Normal-Stage.Core-Player] as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{StageData:{MobType:4},Timer:{WaveWaiting:false}}}} run tag @e[type=slime,distance=..48,tag=!Arena.Normal-Stage.Mob] add Arena.Normal-Stage.Mob


# 不正検知
    # 入場
    execute as @a[tag=!Arena.Normal-Stage.Player,tag=!Arena.Flags-Debug] at @s if entity @e[tag=Arena.Normal-Stage.Stage-Core,distance=..48] run function arena_normal:misc/fraud_entry with entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.AnnounceDisplay

    # 再読み込み
    execute as @a[tag=Arena.Normal-Stage.Player] if score @s Arena.LeaveGame matches 1.. at @s run function arena_normal:misc/relogging with entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.AnnounceDisplay

