## Tick
#> プレイヤー
    # 代表プレイヤーの設定
    execute at @a[tag=Arena.Boss.Player,tag=!Arena.Boss.Core-Player] unless entity @a[tag=Arena.Boss.Core-Player,distance=..128] run function arena_boss:misc/core_player_selection
    
    # tick処理
    execute at @a[tag=Arena.Boss.Core-Player] as @e[tag=Arena.Boss.Main.Core,distance=..64] at @s run function arena_boss:misc/boss_tick with entity @e[tag=Arena.Boss.Stage-Core,distance=..64,sort=nearest,limit=1] data.Arena.Boss.StageData

    # ステージから離れたプレイヤーのタグ除去
    execute as @a[tag=Arena.Boss.Player] at @s unless entity @e[tag=Arena.Boss.Stage-Core,distance=..64] run function arena_boss:misc/player_reset


