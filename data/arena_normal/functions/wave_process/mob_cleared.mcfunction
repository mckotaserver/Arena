## モブクリア時処理
#> 通常
    # Wave: 5 → 終了処理へ
    execute if data entity @s {data:{Arena:{StageData:{Type:"Normal"},Wave:5}}} at @s run function arena_normal:end/_
    execute if data entity @s {data:{Arena:{StageData:{Type:"Normal"},Wave:5}}} at @s run return 0

    # それ以外 → 普通に進行処理
        # 開始タイマー関連処理
            # 目標時刻を設定
            execute store result score #EndTick Arena.Temp run time query gametime

            execute if entity @a[tag=Arena.Normal-Stage.Player,tag=!Arena.Flags-CountSkip] run scoreboard players set #EndTick.DeltaSecond Arena.Temp 15
            execute unless entity @a[tag=Arena.Normal-Stage.Player,tag=!Arena.Flags-CountSkip] run scoreboard players set #EndTick.DeltaSecond Arena.Temp 5

            scoreboard players operation #EndTick.DeltaTick Arena.Temp = #EndTick.DeltaSecond Arena.Temp
            scoreboard players operation #EndTick.DeltaTick Arena.Temp *= #20 Constant

            scoreboard players operation #EndTick Arena.Temp += #EndTick.DeltaTick Arena.Temp

            # マーカーにデータ設定
            execute store result entity @s data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp

            # タイマー待機設定, カウント開始
            data modify entity @s data.Arena.Timer.WaveWaiting set value true
            schedule function arena_normal:misc/wave_timer 1s
        
        # プレイヤー通知
            # playsound
            execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 1

            # tellraw
            tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_announce.normal","with":[{"nbt":"data.Arena.Wave","entity":"@s","color": "gold"},{"score":{"name": "#EndTick.DeltaSecond","objective": "Arena.Temp"},"color": "yellow","underlined": true}]}]

#> エンドレス
    # 報酬配布を判定: ≡ 0 (mod 5)?
    execute store result score #Endless.Wave Arena.Temp run data get entity @s data.Arena.Wave
    scoreboard players operation #Endless.Wave Arena.Temp %= #10 Constant

    # 条件に一致しなければ処理を中断
    execute unless score #Endless.Wave Arena.Temp matches 0 run return 0

    # 条件通過
        # 休憩を倍に
        execute store result score #EndTick Arena.Temp run data get entity @s data.Arena.Timer.EndTick
        execute store result entity @s data.Arena.Timer.EndTick int 1 run scoreboard players add #EndTick Arena.Temp 300

        # チケット配布
        function arena_normal:endless/reward
        
        # tellraw
        tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_announce.endless","with":[{"nbt":"data.Arena.Wave","entity":"@s","color": "gold"},{"score":{"name": "#Reward.TicketCount","objective": "Arena.Temp"},"color": "aqua","bold": true}]}]
 
        
