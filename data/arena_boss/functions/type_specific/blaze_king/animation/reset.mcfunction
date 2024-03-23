## アニメーション終了時処理
# リセット
scoreboard players set @p[tag=arena.boss.Core-Player] Arenaboss.Timer 0

# 
data modify entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.Arena.boss.OperationData.Animation set value "regular"
