#> 前処理
# プレイヤーいなければ中止
execute unless entity @p[tag=Arena.Normal-Stage.Player,distance=..48] run function arena_normal:misc/stage_reset
execute unless entity @p[tag=Arena.Normal-Stage.Player,distance=..48] run return 0

# Timerリセット
data modify entity @s data.Arena.Timer.EndTick set value -1
data modify entity @s data.Arena.Timer.WaveWaiting set value false

# status変更
data modify entity @s data.Arena.status set value "in_wave"

# stage_data → ストレージにコピー
data modify storage arena_normal:temp stage_data set from entity @s data.Arena.stage_data

#> ウェーブ進行処理
    # Wave = Wave +1
    execute store result score #Wave Arena.Temp run data get storage arena_normal:temp stage_data.wave
    scoreboard players add #Wave Arena.Temp 1

    execute store result entity @s data.Arena.stage_data.wave int 1 run scoreboard players get #Wave Arena.Temp
    execute store result storage arena_normal:temp stage_data.wave int 1 run scoreboard players get #Wave Arena.Temp

    # 開始直後 → 記録関連処理
    execute if data storage arena_normal:temp {stage_data:{type:"normal"}} if score #Wave Arena.Temp matches 1 store result entity @s data.Arena.Recording.StartTick int 1 run time query gametime

#> モブの召喚
    # エンドレス特有処理
    execute if data storage arena_normal:temp {stage_data:{type:"endless"}} run function arena_normal:endless/mob_drawing

    # 指定ウェーブのデータを抽出
    data modify storage kota_library: array_picker.in set from entity @s data.Arena.stage_detail.summon_count
    execute store result storage kota_library: array_picker.index int 1 run data get storage arena_normal:temp stage_data.wave 0.9999
    function kota_library:storage_modifier/array_picker with storage kota_library: array_picker

    # 召喚数最大値を計算
        # 元召喚数を取得
        data modify storage arena_normal:temp spawning_data.data_modifying.in.summon_count set value [0, 0, 0, 0, 0]
        data modify storage arena_normal:temp spawning_data.data_modifying.in.summon_count[] set from storage kota_library: array_picker.out
    
        # 倍率を取得 (難易度のみ)
        data modify storage kota_library: array_picker.index set from storage arena_normal:temp stage_data.difficulty
        data modify storage kota_library: array_picker.in set from storage arena:assets stage_difficulty
#tellraw awabi2048 {"nbt":"array_picker.in","storage":"kota_library:"}
        function kota_library:storage_modifier/array_picker with storage kota_library: array_picker

        execute store result storage arena_normal:temp spawning_data.data_modifying.multiplier float 100 run data get storage kota_library: array_picker.out.multiplier
#tellraw awabi2048 {"nbt":"array_picker.out","storage":"kota_library:"}
        
        # その他必要なデータを取得
        data modify storage arena_normal:temp spawning_data.data_modifying.speed_multiplier set value 1.0f
        execute store result storage arena_normal:temp spawning_data.data_modifying.index int 1 run data get storage arena_normal:temp spawning_data.stage_data.wave 0.9999

        # データ修飾functionを呼び出し
        function arena_normal:wave_process/mob_spawning/data_modifier with storage arena_normal:temp spawning_data.data_modifying

        # マーカーにデータ戻す
        data modify entity @s data.Arena.Spawning.Counter set from storage arena_normal:temp spawning_data.data_modifying.out.summon_count

    # 召喚処理
    execute as @e[tag=Arena.Normal-Stage.SpawnMarker,distance=..48,sort=random,limit=1] at @s run function arena_normal:wave_process/mob_spawning/_

#> 演出
# playsound
execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.33 0.5
execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound minecraft:entity.elder_guardian.ambient master @s ~ ~ ~ 0.33 1.1

# Title
title @a[tag=Arena.Normal-Stage.Player,distance=..48] title ""

# 通常 → 1-4: Wave %s, 5: Last Wave
execute if data storage arena_normal:temp {stage_data:{type:"normal"}} if score #Wave Arena.Temp matches 1..4 run title @a[tag=Arena.Normal-Stage.Player,distance=..48] subtitle {"translate":"kota-server.arena.game.message.wave_proceeded","with":[{"score":{"name": "#Wave","objective": "Arena.Temp"},"color": "gold"}]}
execute if data storage arena_normal:temp {stage_data:{type:"normal"}} if score #Wave Arena.Temp matches 5 run title @a[tag=Arena.Normal-Stage.Player,distance=..48] subtitle {"translate":"kota-server.arena.game.message.wave_proceeded-last"}

# エンドレス → 1: [Endless Arena], 2-: Wave %s
execute if data storage arena_normal:temp {stage_data:{type:"endless"}} if score #Wave Arena.Temp matches 1 run title @a[tag=Arena.Normal-Stage.Player,distance=..48] title {"translate":"kota-server.arena.game.message.wave_proceeded-endless"}
execute if data storage arena_normal:temp {stage_data:{type:"endless"}} run title @a[tag=Arena.Normal-Stage.Player,distance=..48] subtitle {"translate":"kota-server.arena.game.message.wave_proceeded","with":[{"score":{"name": "#Wave","objective": "Arena.Temp"},"color": "gold"}]}
    