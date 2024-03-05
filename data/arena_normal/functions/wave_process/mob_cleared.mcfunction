## モブクリア時処理
# タイマー設定
scoreboard players set @p[tag=Arena.Normal-Stage.Core-Player] Arena.Timer 20

# statusを変更
data modify entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.status set value "pre_wave_waiting"
