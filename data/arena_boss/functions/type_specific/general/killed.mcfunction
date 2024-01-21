## 討伐判定
# 演出  
$execute at @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] run function arena_boss:type_specific/$(Directory)/killed
    
#> リセット処理
$function arena_boss:misc/stage_reset {Directory:$(Directory)}

#> 報酬配布
tag @a[tag=Arena.Boss.Player,distance=..64] add Arena.Temp-Boss.RewardWaiting
execute as @r[tag=Arena.Temp-Boss.RewardWaiting] at @s run function arena_boss:type_specific/general/end/reward_give with entity @e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1] data.Arena.Boss.StageData

#> 終了処理
function arena_boss:type_specific/general/end/_
