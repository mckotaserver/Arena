## tick.
# ステージから離れたプレイヤー
execute as @a[tag=arena.normal_stage.player] at @s unless entity @e[tag=arena.normal_stage.stage_core,distance=..32] run function arena_normal:misc/player_reset

# 代表プレイヤー選出
execute as @a[tag=arena.normal_stage.player,tag=!arena.normal_stage.core_player] at @s unless entity @a[tag=arena.normal_stage.core_player,distance=..32] at @s run function arena_normal:misc/core_player_selection

    # モブクリア判定
    execute at @a[tag=arena.normal_stage.core_player] as @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] at @s if data entity @s {data:{arena:{spawning:{counter:0}}}} unless entity @e[tag=arena.normal_stage.mob,distance=..32] unless score @p[tag=arena.normal_stage.core_player] arena.timer = @p[tag=arena.normal_stage.core_player] arena.timer run function arena_normal:wave_process/mob_cleared

    # スライム: 分裂後を認識
    execute at @a[tag=arena.normal_stage.core_player] as @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] at @s if data entity @s {data:{arena:{stage_data:{mob_type:4}}}} run tag @e[type=slime,distance=..32,tag=!arena.normal_stage.mob] add arena.normal_stage.mob

# 不正検知
    # 入場
    execute as @a[tag=!arena.normal_stage.player,tag=!arena.flags.debug_mode] at @s if entity @e[tag=arena.normal_stage.stage_core,distance=..32] run function arena_normal:misc/anti_cheat

    # 再読み込み
    execute as @a[tag=arena.normal_stage.player] if score @s arena.leave_game matches 1.. at @s run function arena_normal:misc/anti_cheat

# タイマー処理
execute as @a[tag=arena.normal_stage.core_player] if score @s arena.timer matches 1.. run scoreboard players remove @s arena.timer 1
execute as @a[tag=arena.normal_stage.core_player] if score @s arena.timer matches 0 at @s as @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] at @s run function arena_normal:timer/_ with entity @s data.arena.scheduler
