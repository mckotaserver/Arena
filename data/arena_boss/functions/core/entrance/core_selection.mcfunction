## Core の取得
$execute as @e[tag=Arena.Boss.Stage-Core] if data entity @s {data:{Arena:{Boss:{StageData:{Id: "$(Id)"}}}}} run tag @s add Arena.Temp-BossJoiningStage
