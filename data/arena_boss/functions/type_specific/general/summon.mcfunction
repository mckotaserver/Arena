## 内部データ関連処理
# Health等
data modify entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.EntityData set from entity @s data.Arena.Boss.StageData.EntityData

# ボスバー
$bossbar add arena_boss:$(Directory) [{"text":"|||","bold": false,"color": "gray","obfuscated": true},{"text": " ","obfuscated": false},{"nbt": "data.Arena.Boss.StageData.DisplayData.Name","entity": "@s","interpret": true, "obfuscated": false,"bold": true},{"text": " ","obfuscated": false},{"text":"|||","bold": false,"color": "gray","obfuscated": true},{"text": " (", "color": "gray", "obfuscated": false},{"nbt": "data.Arena.Boss.EntityData.Health", "entity": "@e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1]", "color": "gold", "interpret": true,"obfuscated": false},{"text": "/", "color": "gray","obfuscated": false},{"nbt": "data.Arena.Boss.EntityData.Health", "entity": "@e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1]", "color": "gray", "interpret": true,"obfuscated": false},{"text": ")", "color": "gray","obfuscated": false}]

    $bossbar set arena_boss:$(Directory) players @a[tag=Arena.Boss.Player,distance=..64]
    $execute store result bossbar arena_boss:$(Directory) max run data get entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.EntityData.Health
    $execute store result bossbar arena_boss:$(Directory) value run data get entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.EntityData.Health

$bossbar set arena_boss:$(Directory) color yellow
$bossbar set arena_boss:$(Directory) style notched_10

# 行動開始
scoreboard players set @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] ArenaBoss.Timer 20

#> ダメージ記録のリセット
scoreboard players set @a[tag=Arena.Boss.Player,distance=..64] ArenaBoss.PlayerDealtDamage 0
