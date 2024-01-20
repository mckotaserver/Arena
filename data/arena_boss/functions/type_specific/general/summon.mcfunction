## 内部データ関連処理
# Health等
data modify entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.EntityData set from entity @s data.Arena.Boss.StageData.EntityData

# ボスバー
$bossbar add arena_boss:$(Directory) [{"text":"|||","bold": false,"obfuscated": true,"color": "gray"}," ",{"nbt": "data.Arena.Boss.StageData.DisplayData.Name","entity": "@s","interpret": true, "obfuscated": false}," ",{"text":"|||","bold": false,"obfuscated": true,"color": "gray"}]

    $bossbar set arena_boss:$(Directory) players @a[tag=Arena.Player,distance=..64]
    $execute store result bossbar arena_boss:$(Directory) max run data get entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.StageData.EntityData.Health
    $execute store result bossbar arena_boss:$(Directory) value run data get entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.StageData.EntityData.Health

$bossbar set arena_boss:$(Directory) color yellow
$bossbar set arena_boss:$(Directory) style notched_10

# 行動開始
scoreboard players set @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] ArenaBoss.Timer 20
