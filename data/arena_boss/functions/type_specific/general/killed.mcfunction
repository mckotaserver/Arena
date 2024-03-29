## 討伐判定
# 演出  
$execute at @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] run function arena_boss:type_specific/$(Directory)/killed
    
#> リセット処理
$function arena_boss:misc/stage_reset {Directory:$(Directory)}

#> 報酬配布
    # 1st のプレイヤーを検出
    tag @a[tag=arena.boss.player,distance=..64] add arena.temp-boss.RewardWaiting
    scoreboard players set #boss.DamageRanking.Next arena.temp -1

    scoreboard players operation #boss.DamageRanking.Next arena.temp > @a[tag=arena.boss.player,distance=..64] arenaboss.playerDealtDamage

    # リセット
    scoreboard players set #boss.DamageRanking.Rank arena.temp 0

    # 再起処理
    execute as @a[tag=arena.temp-boss.RewardWaiting] if score @s arenaboss.playerDealtDamage = #boss.DamageRanking.Next arena.temp at @s run function arena_boss:type_specific/general/end/reward_give with entity @e[tag=arena.boss.stage_core,sort=nearest,limit=1] data.arena.boss.StageData

#> 終了処理
function arena_boss:type_specific/general/end/_
