## モブクリア時処理
#> 通常
    # Wave: 5 → 終了処理へ
    execute if data entity @s {data:{Arena:{stage_data:{type:"normal",wave:5}}}} at @s run function arena_normal:end/_ with entity @s data.Arena.stage_data
    execute if data entity @s {data:{Arena:{stage_data:{type:"normal",wave:5}}}} at @s run return 0

    # それ以外 → 普通に進行処理   
        # playsound
        execute as @a[tag=arena.normal-stage.Player,distance=..48] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 1

        # tellraw
        tellraw @a[tag=arena.normal-stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_announce.normal","with":[{"nbt":"data.Arena.stage_data.wave","entity":"@s","color": "gold"},{"text":"5","color": "yellow","underlined": true}]}]
say wave waiting
        # タイマー設定
        execute as @a[tag=arena.normal-stage.Player,distance=..48] if entity @s[tag=!Arena.Flags-CountSkip] run scoreboard players set @p[tag=arena.normal-stage.Core-Player] Arena.Timer 300
        execute as @a[tag=arena.normal-stage.Player,distance=..48] unless entity @s[tag=!Arena.Flags-CountSkip] run scoreboard players set @p[tag=arena.normal-stage.Core-Player] Arena.Timer 100

# タイマー関連処理
data modify entity @s data.Arena.status set value "wave_waiting"
execute store result entity @s data.Arena.misc.countdown int 0.05 run scoreboard players get @p[tag=arena.normal-stage.Core-Player] Arena.Timer

#> エンドレス
    # エンドレスでないなら処理中断
    execute unless data entity @s {data:{Arena:{stage_data:{type:"endless"}}}} run return 0

    # 報酬配布を判定: wave ≡ 0 (mod 5)?
    execute store result score #Endless.Wave Arena.Temp run data get entity @s data.Arena.stage_data.wave
    scoreboard players operation #Endless.Wave Arena.Temp %= #5 Constant

    # 条件に一致しなければ処理を中断
    execute unless score #Endless.Wave Arena.Temp matches 0 run return 0

    # 条件通過
        # 休憩を倍に
        scoreboard players operation @p[tag=arena.normal-stage.Core-Player] Arena.Timer *= #2 Constant

        # チケット配布
        function arena_normal:endless/reward
        
        # tellraw
        tellraw @a[tag=arena.normal-stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_announce.endless","with":[{"nbt":"data.Arena.stage_data.wave","entity":"@s","color": "gold"},{"score":{"name": "#Reward.TicketCount","objective": "arena.Temp"},"color": "aqua","bold": true}]}]


