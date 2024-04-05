#> 前処理
# timerリセット
data modify entity @s data.arena.timer.Endtick set value -1
data modify entity @s data.arena.timer.WaveWaiting set value false

# エンドレス → モブ抽選
execute if data entity @s {data:{arena:{stage_data:{type:"endless"}}}} run function arena_normal:endless/mob_drawing

# stage_data → ストレージにコピー
data modify storage arena_normal:temp stage_data set from entity @s data.arena.stage_data

#> ウェーブ進行処理
    # Wave = Wave +1
    execute store result score #Wave arena.temp run data get storage arena_normal:temp stage_data.wave
    scoreboard players add #Wave arena.temp 1

    execute store result entity @s data.arena.stage_data.wave int 1 run scoreboard players get #Wave arena.temp
    execute store result storage arena_normal:temp stage_data.wave int 1 run scoreboard players get #Wave arena.temp

    # 開始直後 → 記録関連処理
    execute if data storage arena_normal:temp {stage_data:{type:"normal"}} if score #Wave arena.temp matches 1 store result entity @s data.arena.recording.start_tick int 1 run time query gametime

#> モブの召喚
    # 召喚数の設定
        # プレイ中のステージのモブ種類データを取得
        data modify storage kota_library: array_picker.in set from storage arena:assets stage_data
        data modify storage kota_library: array_picker.index set from storage arena_normal:temp stage_data.mob_type

        function kota_library:storage_modifier/array_picker with storage kota_library: array_picker

        # 上記検索結果から, 現在のウェーブの召喚数データを取得
        data modify storage kota_library: array_picker.in set from storage kota_library: array_picker.out.summon_count

        execute if data storage arena_normal:temp {stage_data:{type:"normal"}} store result storage kota_library: array_picker.index int 1 run data get storage arena_normal:temp stage_data.wave 0.9999
        execute if data storage arena_normal:temp {stage_data:{type:"endless"}} run data modify storage kota_library: array_picker.index set value 4

        function kota_library:storage_modifier/array_picker with storage kota_library: array_picker

        execute store result score #summon_count arena.temp run data get storage kota_library: array_picker.out

        # 難易度による倍率(計算済み)を取得
        execute store result score #difficulty_multiplier arena.temp run data get storage arena_normal:temp stage_data.multipliers.base 100

        # 上ふたつを掛け算
        scoreboard players operation #summon_count arena.temp *= #difficulty_multiplier arena.temp

        # マーカーにデータ戻す
        execute store result entity @s data.arena.spawning.counter int 0.01 run scoreboard players get #summon_count arena.temp

    # ステータス倍率の再計算; エンドレスならウェーブを乗算
        # ウェーブ → エンドレスなら +3 %/wave
        execute store result score #data_modifying.result arena.temp run data get storage arena_normal:temp spawning_data.stage_data.multipliers.base 100
        execute store result score #data_modifying.wave_bonus arena.temp run data get storage arena:assets config.arena_normal.endless.wave_bonus

        scoreboard players operation #data_modifying.result arena.temp += #data_modifying.wave_bonus arena.temp

        # マーカーに保存
        execute if data storage arena_normal:temp {spawning_data:{stage_data:{type:"endless"}}} store result entity @s data.arena.stage_data.multipliers.base float 0.01 run scoreboard players get #data_modifying.result arena.temp

    # 召喚処理
    execute as @e[tag=arena.normal_stage.spawn_marker,distance=..32,sort=random,limit=1] at @s run function arena_normal:wave_process/mob_spawning/_

#> 演出
# playsound
execute as @a[tag=arena.normal_stage.player,distance=..32] at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.33 0.5
execute as @a[tag=arena.normal_stage.player,distance=..32] at @s run playsound minecraft:entity.elder_guardian.ambient master @s ~ ~ ~ 0.33 1.1

# Title
title @a[tag=arena.normal_stage.player,distance=..32] title ""

# 通常 → 1-4: Wave %s, 5: Last Wave
execute if data storage arena_normal:temp {stage_data:{type:"normal"}} if score #Wave arena.temp matches 1..4 run title @a[tag=arena.normal_stage.player,distance=..32] subtitle {"translate":"kota-server.arena.game.message.wave_proceeded","with":[{"score":{"name": "#Wave","objective": "arena.temp"},"color": "gold"}]}
execute if data storage arena_normal:temp {stage_data:{type:"normal"}} if score #Wave arena.temp matches 5 run title @a[tag=arena.normal_stage.player,distance=..32] subtitle {"translate":"kota-server.arena.game.message.wave_proceeded-last"}

# エンドレス → 1: [Endless arena], 2-: Wave %s
execute if data storage arena_normal:temp {stage_data:{type:"endless"}} if score #Wave arena.temp matches 1 run title @a[tag=arena.normal_stage.player,distance=..32] title {"translate":"kota-server.arena.game.message.wave_proceeded-endless"}
execute if data storage arena_normal:temp {stage_data:{type:"endless"}} run title @a[tag=arena.normal_stage.player,distance=..32] subtitle {"translate":"kota-server.arena.game.message.wave_proceeded","with":[{"score":{"name": "#Wave","objective": "arena.temp"},"color": "gold"}]}


