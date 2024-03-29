## ボス本体 tick処理
$function arena_boss:type_specific/$(Directory)/tick with entity @e[tag=arena.boss.Main.Core,distance=..64,sort=nearest,limit=1] data.arena.boss.OperationData

execute as @e[tag=arena.boss.Main.Core,distance=..64] if score @s arenaboss.Timer matches 1.. run scoreboard players remove @e[tag=arena.boss.Main.Core,distance=..64] arenaboss.Timer 1
execute as @e[tag=arena.boss.Main.Core,distance=..64] if score @s arenaboss.Timer matches 0 at @s run function arena_boss:type_specific/general/behavior with entity @e[tag=arena.boss.stage_core,sort=nearest,limit=1] data.arena.boss.StageData
