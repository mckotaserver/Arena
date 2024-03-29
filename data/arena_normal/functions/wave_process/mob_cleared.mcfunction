## モブクリア時処理
# タイマー設定
scoreboard players set @p[tag=arena.normal_stage.core_player] arena.timer 40

# statusを変更
data modify entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.scheduler.command set value "function arena_normal:wave_process/wave_waiting"
