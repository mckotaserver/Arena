## アニメーション開始
# タイマーリセット
scoreboard players set @p[tag=arena.boss.Core-Player] Arenaboss.Timer 0

# データセット
$data modify entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.Arena.boss.OperationData.Animation set value "$(Animation)"
    
