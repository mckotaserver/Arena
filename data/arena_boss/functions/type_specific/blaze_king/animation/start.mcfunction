## アニメーション開始
# タイマーリセット
scoreboard players set @p[tag=Arena.Boss.Core-Player] ArenaBoss.Timer 0

# データセット
$data modify entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.OperationData.Animation set value "$(Animation)"
    
