## Core の取得
$execute as @e[tag=arena.boss.stage_core] if data entity @s {data:{arena:{boss:{StageData:{Id: "$(Id)"}}}}} run tag @s add arena.temp-bossJoiningStage
