## 記録表示ディスプレイ: 設置
# marker
$execute align xyz run summon marker ~0.5 ~0.75 ~0.5 {Tags:["arena.normal-stage.Display.Core","arena.normal-stage.Display.Element"],data:{Arena:{Display:{mob_type:0}}},Rotation:[$(facing)f,0f]}

# text_display
$execute as @e[tag=arena.normal-stage.Display.Core,sort=nearest,limit=1] at @s run summon text_display ^ ^1.9 ^ {text:'[{"text": "【ハード・ゾンビアリーナ】\\n","color": "red","bold": true},{"text": "クリアタイムランキング","color": "gold","bold": true}]',Tags:["arena.normal-stage.Display.Text-Title","arena.normal-stage.Display.Element"],Rotation:[$(facing)f,0f],alignment:"center"}

$execute as @e[tag=arena.normal-stage.Display.Core,sort=nearest,limit=1] at @s run summon text_display ^ ^0.5 ^ {Tags:["arena.normal-stage.Display.Text-Record","arena.normal-stage.Display.Element"],alignment:"left",Rotation:[$(facing)f,0f]}

# interaction
$execute as @e[tag=arena.normal-stage.Display.Core,sort=nearest,limit=1] at @s run summon interaction ^1 ^ ^ {height:0.2f,width:0.25f,Tags:["arena.normal-stage.Display.Interaction-Next","arena.normal-stage.Display.Element"],Rotation:[$(facing)f,0f]}
$execute as @e[tag=arena.normal-stage.Display.Core,sort=nearest,limit=1] at @s run summon interaction ^-1 ^ ^ {height:0.2f,width:0.25f,Tags:["arena.normal-stage.Display.Interaction-Prev","arena.normal-stage.Display.Element"],Rotation:[$(facing)f,0f]}

$execute as @e[tag=arena.normal-stage.Display.Core,sort=nearest,limit=1] at @s run summon text_display ^1 ^ ^ {text:'{"text": ">>","color": "white","bold": true}',Tags:["arena.normal-stage.Display.Text-Arrow","arena.normal-stage.Display.Element"],Rotation:[$(facing)f,0f]}
$execute as @e[tag=arena.normal-stage.Display.Core,sort=nearest,limit=1] at @s run summon text_display ^-1 ^ ^ {text:'{"text": "<<","color": "white","bold": true}',Tags:["arena.normal-stage.Display.Text-Arrow","arena.normal-stage.Display.Element"],Rotation:[$(facing)f,0f]}

# データ更新
execute as @e[tag=arena.normal-stage.Display.Core,sort=nearest,limit=1] at @s run function arena_normal:recording/display/reflesh with entity @s data.Arena.Display

