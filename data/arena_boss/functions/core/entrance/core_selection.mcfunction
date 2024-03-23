## Core の取得
$execute as @e[tag=arena.boss.Stage-Core] if data entity @s {data:{Arena:{boss:{StageData:{Id: "$(Id)"}}}}} run tag @s add Arena.Temp-bossJoiningStage
