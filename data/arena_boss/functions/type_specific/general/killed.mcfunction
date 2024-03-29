## 討伐判定
# 演出  
$execute at @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] run function arena_boss:type_specific/$(Directory)/killed
    
#> リセット処理
$function arena_boss:misc/stage_reset {Directory:$(Directory)}

#> 報酬配布
    # 1st のプレイヤーを検出
    tag @a[tag=Arena.Boss.Player,distance=..64] add Arena.Temp-Boss.RewardWaiting
    scoreboard players set #Boss.DamageRanking.Next Arena.Temp -1

    scoreboard players operation #Boss.DamageRanking.Next Arena.Temp > @a[tag=Arena.Boss.Player,distance=..64] ArenaBoss.PlayerDealtDamage

    # リセット
    scoreboard players set #Boss.DamageRanking.Rank Arena.Temp 0

    # 再起処理
    execute as @a[tag=Arena.Temp-Boss.RewardWaiting] if score @s ArenaBoss.PlayerDealtDamage = #Boss.DamageRanking.Next Arena.Temp at @s run function arena_boss:type_specific/general/end/reward_give with entity @e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1] data.Arena.Boss.StageData

#> 終了処理
function arena_boss:type_specific/general/end/_
