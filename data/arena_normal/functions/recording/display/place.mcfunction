## 記録表示ディスプレイ: 設置
# marker
$execute align xyz run summon marker ~0.5 ~0.75 ~0.5 {Tags:["arena.normal_stage.display.core","arena.normal_stage.display.element"],data:{arena:{display:{mob_type:0}}},Rotation:[$(facing)f,0f]}

# text_display
$execute as @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] at @s run summon text_display ^ ^1.9 ^ {text:'[{"text": "【ハード・ゾンビアリーナ】\\n","color": "red","bold": true},{"text": "クリアタイムランキング","color": "gold","bold": true}]',Tags:["arena.normal_stage.display.text-Title","arena.normal_stage.display.element"],Rotation:[$(facing)f,0f],alignment:"center"}

$execute as @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] at @s run summon text_display ^ ^0.5 ^ {Tags:["arena.normal_stage.display.text-record","arena.normal_stage.display.element"],alignment:"left",Rotation:[$(facing)f,0f]}

# interaction
$execute as @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] at @s run summon interaction ^1 ^ ^ {height:0.2f,width:0.25f,Tags:["arena.normal_stage.display.interaction-next","arena.normal_stage.display.element"],Rotation:[$(facing)f,0f]}
$execute as @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] at @s run summon interaction ^-1 ^ ^ {height:0.2f,width:0.25f,Tags:["arena.normal_stage.display.interaction-prev","arena.normal_stage.display.element"],Rotation:[$(facing)f,0f]}

$execute as @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] at @s run summon text_display ^1 ^ ^ {text:'{"text": ">>","color": "white","bold": true}',Tags:["arena.normal_stage.display.text-Arrow","arena.normal_stage.display.element"],Rotation:[$(facing)f,0f]}
$execute as @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] at @s run summon text_display ^-1 ^ ^ {text:'{"text": "<<","color": "white","bold": true}',Tags:["arena.normal_stage.display.text-Arrow","arena.normal_stage.display.element"],Rotation:[$(facing)f,0f]}

# データ更新
execute as @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] at @s run function arena_normal:recording/display/reflesh with entity @s data.arena.display

# tellraw
execute as @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] run tellraw @p [{"text": "ランキング表示を","color": "gray"},{"text": "","color": "gold","extra":["(",{"nbt":"Pos[0]","entity": "@s"},", ",{"nbt":"Pos[1]","entity": "@s"},", ",{"nbt":"Pos[2]","entity": "@s"},")"]},{"text": "に設置しました。","color": "gray"}]
