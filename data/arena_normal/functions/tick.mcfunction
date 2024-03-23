## Tick.
# ステージから離れたプレイヤー
execute as @a[tag=arena.normal-stage.Player] at @s unless entity @e[tag=arena.normal-stage.Stage-Core,distance=..48] run function arena_normal:misc/player_reset

# 代表プレイヤー選出
execute as @a[tag=arena.normal-stage.Player,tag=!Arena.normal-stage.Core-Player] at @s unless entity @a[tag=arena.normal-stage.Core-Player,distance=..48] at @s run function arena_normal:misc/core_player_selection

    # モブクリア判定
    execute at @a[tag=arena.normal-stage.Core-Player] as @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{Spawning:{counter:0},Timer:{WaveWaiting:false}}}} unless entity @e[tag=arena.normal-stage.Mob,distance=..48] unless score @p[tag=arena.normal-stage.Core-Player] Arena.Timer matches 1.. run function arena_normal:wave_process/mob_cleared

    # スライム: 分裂後を認識
    execute at @a[tag=arena.normal-stage.Core-Player] as @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{stage_data:{mob_type:4},Timer:{WaveWaiting:false}}}} run tag @e[type=slime,distance=..48,tag=!Arena.normal-stage.Mob] add Arena.normal-stage.Mob

# 不正検知
    # 入場
    execute as @a[tag=!Arena.normal-stage.Player,tag=!Arena.Flags-Debug] at @s if entity @e[tag=arena.normal-stage.Stage-Core,distance=..48] run function arena_normal:misc/anti_cheat

    # 再読み込み
    execute as @a[tag=arena.normal-stage.Player] if score @s Arena.LeaveGame matches 1.. at @s run function arena_normal:misc/anti_cheat

# タイマー処理
execute as @a[tag=arena.normal-stage.Core-Player] if score @s Arena.Timer matches 1.. run scoreboard players remove @s Arena.Timer 1
execute as @a[tag=arena.normal-stage.Core-Player] if score @s Arena.Timer matches 0 at @s as @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] at @s run function arena_normal:timer/_
