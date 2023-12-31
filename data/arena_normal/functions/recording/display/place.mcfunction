## 記録表示ディスプレイ: 設置
# marker
$execute align xyz run summon marker ~0.5 ~0.75 ~0.5 {Tags:["Arena.Normal-Stage.Display.Core","Arena.Normal-Stage.Display.Element"],data:{Arena:{Display:{MobType:0}}},Rotation:[$(Facing)f,0f]}

# text_display
$execute as @e[tag=Arena.Normal-Stage.Display.Core,sort=nearest,limit=1] at @s run summon text_display ^ ^1.9 ^ {text:'[{"text": "【ハード・ゾンビアリーナ】\\n","color": "red","bold": true},{"text": "クリアタイムランキング","color": "gold","bold": true}]',Tags:["Arena.Normal-Stage.Display.Text-Title","Arena.Normal-Stage.Display.Element"],Rotation:[$(Facing)f,0f],alignment:"center"}

$execute as @e[tag=Arena.Normal-Stage.Display.Core,sort=nearest,limit=1] at @s run summon text_display ^ ^0.5 ^ {Tags:["Arena.Normal-Stage.Display.Text-Record","Arena.Normal-Stage.Display.Element"],alignment:"left",Rotation:[$(Facing)f,0f]}

# interaction
$execute as @e[tag=Arena.Normal-Stage.Display.Core,sort=nearest,limit=1] at @s run summon interaction ^1 ^ ^ {height:0.2f,width:0.25f,Tags:["Arena.Normal-Stage.Display.Interaction-Next","Arena.Normal-Stage.Display.Element"],Rotation:[$(Facing)f,0f]}
$execute as @e[tag=Arena.Normal-Stage.Display.Core,sort=nearest,limit=1] at @s run summon interaction ^-1 ^ ^ {height:0.2f,width:0.25f,Tags:["Arena.Normal-Stage.Display.Interaction-Prev","Arena.Normal-Stage.Display.Element"],Rotation:[$(Facing)f,0f]}

$execute as @e[tag=Arena.Normal-Stage.Display.Core,sort=nearest,limit=1] at @s run summon text_display ^1 ^ ^ {text:'{"text": ">>","color": "white","bold": true}',Tags:["Arena.Normal-Stage.Display.Text-Arrow","Arena.Normal-Stage.Display.Element"],Rotation:[$(Facing)f,0f]}
$execute as @e[tag=Arena.Normal-Stage.Display.Core,sort=nearest,limit=1] at @s run summon text_display ^-1 ^ ^ {text:'{"text": "<<","color": "white","bold": true}',Tags:["Arena.Normal-Stage.Display.Text-Arrow","Arena.Normal-Stage.Display.Element"],Rotation:[$(Facing)f,0f]}

# データ更新
execute as @e[tag=Arena.Normal-Stage.Display.Core,sort=nearest,limit=1] at @s run function arena_normal:recording/display/reflesh with entity @s data.Arena.Display

