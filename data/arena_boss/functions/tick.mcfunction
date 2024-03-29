## Tick
#> プレイヤー
    # 代表プレイヤーの設定
    execute at @a[tag=arena.boss.player,tag=!arena.boss.core_player] unless entity @a[tag=arena.boss.core_player,distance=..128] run function arena_boss:misc/core_player_selection
    
    # tick処理
    execute at @a[tag=arena.boss.core_player] as @e[tag=arena.boss.Main.Core,distance=..64] at @s run function arena_boss:misc/boss_tick with entity @e[tag=arena.boss.stage_core,distance=..64,sort=nearest,limit=1] data.arena.boss.StageData

    # ステージから離れたプレイヤーのタグ除去
    execute as @a[tag=arena.boss.player] at @s unless entity @e[tag=arena.boss.stage_core,distance=..64] run function arena_boss:misc/player_reset


