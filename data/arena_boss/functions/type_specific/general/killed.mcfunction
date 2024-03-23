## 討伐判定
# 演出  
$execute at @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] run function arena_boss:type_specific/$(Directory)/killed
    
#> リセット処理
$function arena_boss:misc/stage_reset {Directory:$(Directory)}

#> 報酬配布
    # 1st のプレイヤーを検出
    tag @a[tag=arena.boss.Player,distance=..64] add Arena.Temp-boss.RewardWaiting
    scoreboard players set #boss.DamageRanking.Next Arena.Temp -1

    scoreboard players operation #boss.DamageRanking.Next Arena.Temp > @a[tag=arena.boss.Player,distance=..64] Arenaboss.PlayerDealtDamage

    # リセット
    scoreboard players set #boss.DamageRanking.Rank Arena.Temp 0

    # 再起処理
    execute as @a[tag=arena.Temp-boss.RewardWaiting] if score @s Arenaboss.PlayerDealtDamage = #boss.DamageRanking.Next Arena.Temp at @s run function arena_boss:type_specific/general/end/reward_give with entity @e[tag=arena.boss.Stage-Core,sort=nearest,limit=1] data.Arena.boss.StageData

#> 終了処理
function arena_boss:type_specific/general/end/_
