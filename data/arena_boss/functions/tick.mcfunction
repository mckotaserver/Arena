## Tick
#> プレイヤー
    # 代表プレイヤーの設定
    execute at @a[tag=arena.boss.Player,tag=!Arena.boss.Core-Player] unless entity @a[tag=arena.boss.Core-Player,distance=..128] run function arena_boss:misc/core_player_selection
    
    # tick処理
    execute at @a[tag=arena.boss.Core-Player] as @e[tag=arena.boss.Main.Core,distance=..64] at @s run function arena_boss:misc/boss_tick with entity @e[tag=arena.boss.Stage-Core,distance=..64,sort=nearest,limit=1] data.Arena.boss.StageData

    # ステージから離れたプレイヤーのタグ除去
    execute as @a[tag=arena.boss.Player] at @s unless entity @e[tag=arena.boss.Stage-Core,distance=..64] run function arena_boss:misc/player_reset


