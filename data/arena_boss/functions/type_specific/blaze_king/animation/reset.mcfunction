## アニメーション終了時処理
# リセット
scoreboard players set @p[tag=arena.boss.core_player] arenaboss.Timer 0

# 
data modify entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.arena.boss.OperationData.Animation set value "regular"
