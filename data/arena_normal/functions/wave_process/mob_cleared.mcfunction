## モブクリア時処理
# タイマー設定
scoreboard players set @p[tag=arena.normal-stage.Core-Player] Arena.Timer 20

# statusを変更
data modify entity @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] data.Arena.status set value "mob_cleared"
