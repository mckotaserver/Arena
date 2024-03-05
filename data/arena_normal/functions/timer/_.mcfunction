## タイマー処理 カウント終了時; data.Arena.statusによって判別
# 判別に用いるデータをコピー
data modify storage arena_normal:temp stage_status set from entity @s data.Arena.status

#> statusに応じて処理を分岐
    # ウェーブ開始前: status:"pre_stage" → ウェーブ開始処理
    execute if data storage arena_normal:temp {stage_status:"wave_waiting"} run function arena_normal:wave_process/count_down

    # ウェーブ中: status: "in_wave" → モブクリア時
    execute if data storage arena_normal:temp {stage_status:"in_wave"} run function arena_normal:wave_process/mob_cleared

    # ウェーブ中: status: "pre_wave_waiting" → ウェーブ待機へ
    execute if data storage arena_normal:temp {stage_status:"pre_wave_waiting"} run function arena_normal:wave_process/wave_waiting

