## ウェーブ終了時処理
#> 通常
    # wave: 5 → 終了処理へ
    execute if data entity @s {data:{arena:{stage_data:{type:"normal",wave:5}}}} at @s run function arena_normal:end/_ with entity @s data.arena.stage_data
    execute if data entity @s {data:{arena:{stage_data:{type:"normal",wave:5}}}} at @s run return 0

    # それ以外 → 普通に進行処理   
        # playsound
        execute as @a[tag=arena.normal_stage.player,distance=..48] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 1

        # タイマー設定
        execute if entity @a[tag=arena.normal_stage.player,tag=!arena.flags.count_skip,distance=..48] run scoreboard players set @p[tag=arena.normal_stage.core_player] arena.timer 300
        execute unless entity @a[tag=arena.normal_stage.player,tag=!arena.flags.count_skip,distance=..48] run scoreboard players set @p[tag=arena.normal_stage.core_player] arena.timer 100

        # tellraw
        execute store result storage arena_normal:temp misc.tellraw.wave_break int 0.05 run scoreboard players get @p[tag=arena.normal_stage.core_player] arena.timer
        tellraw @a[tag=arena.normal_stage.player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_announce.normal","with":[{"nbt":"data.arena.stage_data.wave","entity":"@s","color": "gold"},{"nbt":"misc.tellraw.wave_break","storage":"arena_normal:temp","color": "yellow","underlined": true}]}]

# タイマー関連処理
execute store result entity @s data.arena.misc.countdown int 0.05 run scoreboard players get @p[tag=arena.normal_stage.core_player] arena.timer
function arena_normal:wave_process/count_down

#> エンドレス
    # エンドレスでないなら処理中断
    execute unless data entity @s {data:{arena:{stage_data:{type:"endless"}}}} run return 0

    # 報酬配布を判定: wave ≡ 0 (mod 5)?
    execute store result score #endless.wave arena.temp run data get entity @s data.arena.stage_data.wave
    scoreboard players operation #endless.wave arena.temp %= #5 Constant

    # 条件に一致しなければ処理を中断
    execute unless score #endless.wave arena.temp matches 0 run return 0

    # 条件通過
        # 休憩を倍に
        scoreboard players operation @p[tag=arena.normal_stage.core_player] arena.timer *= #2 Constant

        # チケット配布
        function arena_normal:endless/reward with storage arena:assets config.arena_normal.endless.reward
        
        # tellraw
        tellraw @a[tag=arena.normal_stage.player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_announce.endless","with":[{"nbt":"data.arena.stage_data.wave","entity":"@s","color": "gold"},{"score":{"name": "#reward.ticket_count","objective": "arena.temp"},"color": "aqua","bold": true}]}]


