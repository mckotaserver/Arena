## アニメーション終了時処理
# リセット
scoreboard players set @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer 0

# 
data modify entity @e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1] data.Arena.Boss.OperationData.Animation set value ""