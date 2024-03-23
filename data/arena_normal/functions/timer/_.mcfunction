## タイマー処理 カウント終了時; data.Arena.statusによって判別
# 判別に用いるデータをコピー
data modify storage arena_normal:temp stage_status set from entity @s data.Arena.status

#> statusに応じて処理を分岐
    # ウェーブ開始前: status:"pre_stage" → ウェーブ開始処理
    execute if data storage arena_normal:temp {stage_status:"wave_waiting"} run function arena_normal:wave_process/count_down

    # ウェーブ中: status: "in_wave" → モブクリア判定
    execute if data storage arena_normal:temp {stage_status:"in_wave"} run function arena_normal:wave_process/mob_cleared

    # ウェーブ中: status: "mob_spawning" → 再度召喚
    execute if data storage arena_normal:temp {stage_status:"mob_spawning"} as @e[tag=arena.normal-stage.SpawnMarker,sort=random,limit=1,distance=..48,tag=!Arena.Temp-RecentSpawnedPos] at @s run function arena_normal:wave_process/mob_spawning/_

    # ウェーブ中: status: "pre_wave_waiting" → ウェーブ待機へ
    execute if data storage arena_normal:temp {stage_status:"mob_cleared"} run function arena_normal:wave_process/wave_waiting

    # ウェーブ中: status: "pre_end" → 終了処理
    execute if data storage arena_normal:temp {stage_status:"pre_end"} run function arena_normal:end/main


tellraw awabi2048 {"nbt":"stage_status","storage": "arena_normal:temp"}
