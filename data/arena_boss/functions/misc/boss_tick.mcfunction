## ボス本体 tick処理
$function arena_boss:type_specific/$(Directory)/tick with entity @e[tag=Arena.Boss.Main.Core,distance=..64,sort=nearest,limit=1] data.Arena.Boss.OperationData

execute as @e[tag=Arena.Boss.Main.Core,distance=..64] if score @s ArenaBoss.Timer matches 1.. run scoreboard players remove @e[tag=Arena.Boss.Main.Core,distance=..64] ArenaBoss.Timer 1
execute as @e[tag=Arena.Boss.Main.Core,distance=..64] if score @s ArenaBoss.Timer matches 0 at @s run function arena_boss:type_specific/general/behavior with entity @e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1] data.Arena.Boss.StageData

