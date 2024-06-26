## 内部データ関連処理
# Health等
data modify entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.arena.boss.EntityData set from entity @s data.arena.boss.StageData.EntityData

# ボスバー
$bossbar add arena_boss:$(Directory) [{"text":"|||","bold": false,"color": "gray","obfuscated": true},{"text": " ","obfuscated": false},{"nbt": "data.arena.boss.StageData.DisplayData.Name","entity": "@s","interpret": true, "obfuscated": false,"bold": true},{"text": " ","obfuscated": false},{"text":"|||","bold": false,"color": "gray","obfuscated": true},{"text": " (", "color": "gray", "obfuscated": false},{"nbt": "data.arena.boss.EntityData.Health", "entity": "@e[tag=arena.boss.Main.Core,sort=nearest,limit=1]", "color": "gold", "interpret": true,"obfuscated": false},{"text": "/", "color": "gray","obfuscated": false},{"nbt": "data.arena.boss.EntityData.Health", "entity": "@e[tag=arena.boss.Main.Core,sort=nearest,limit=1]", "color": "gray", "interpret": true,"obfuscated": false},{"text": ")", "color": "gray","obfuscated": false}]

    $bossbar set arena_boss:$(Directory) players @a[tag=arena.boss.player,distance=..64]
    $execute store result bossbar arena_boss:$(Directory) max run data get entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.arena.boss.EntityData.Health
    $execute store result bossbar arena_boss:$(Directory) value run data get entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.arena.boss.EntityData.Health

$bossbar set arena_boss:$(Directory) color yellow
$bossbar set arena_boss:$(Directory) style notched_10

# 行動開始
scoreboard players set @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] arenaboss.Timer 20

#> ダメージ記録のリセット
scoreboard players set @a[tag=arena.boss.player,distance=..64] arenaboss.playerDealtDamage 0
