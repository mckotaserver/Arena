## ディスプレイ表示のリセット
#> Kill
# kill
kill @e[tag=Arena.Normal-Stage.Selector,distance=..4]

#> 各種構成エンティティを再Summon
# text_display: 【通常アリーナ】
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.25f,1.25f,1.25f],translation:[0.0f,2.0f,0.0f]},"alignment":"center",Tags:["Arena.Normal-Stage.Selector.Element-01","Arena.Normal-Stage.Selector"],text:'{"text": "","extra": [{"text": "【","color": "aqua","bold": true},{"text": "通常アリーナ","color": "yellow","bold": true},{"text": "】","color": "aqua","bold": true}]}'}

# モブ種類 / ナンイド選択 text_display: <<［null］>>, interaction, text_display: <<［null］>>, interaction 
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,1.33f,0.0f]},"alignment":"center",Tags:["Arena.Normal-Stage.Selector.Element-04","Arena.Normal-Stage.Selector"],text:'{"text": "","extra": [{"text": "［","color": "white","bold": true},{"text": "null","color": "yellow","bold": true},{"text": "］","color": "white","bold": true},{"text": "\\n［","color": "white","bold": true},{"text": "null","color": "yellow","bold": true},{"text": "］","color": "white","bold": true}]}'}

summon interaction ^1 ^1.6 ^ {Tags:["Arena.Normal-Stage.Selector.Interaction-01","Arena.Normal-Stage.Selector"],height:0.2f,width:0.25f}
summon interaction ^-1 ^1.6 ^ {Tags:["Arena.Normal-Stage.Selector.Interaction-02","Arena.Normal-Stage.Selector"],height:0.2f,width:0.25f}

summon interaction ^1 ^1.36 ^ {Tags:["Arena.Normal-Stage.Selector.Interaction-03","Arena.Normal-Stage.Selector"],height:0.2f,width:0.25f}
summon interaction ^-1 ^1.36 ^ {Tags:["Arena.Normal-Stage.Selector.Interaction-04","Arena.Normal-Stage.Selector"],height:0.2f,width:0.25f}

summon text_display ^-1 ^1.575 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["Arena.Normal-Stage.Selector.Element-06","Arena.Normal-Stage.Selector"],text:'{"text": "<<","color": "white","bold": true}'}
summon text_display ^1 ^1.575 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["Arena.Normal-Stage.Selector.Element-06","Arena.Normal-Stage.Selector"],text:'{"text": ">>","color": "white","bold": true}'}

summon text_display ^-1 ^1.3 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["Arena.Normal-Stage.Selector.Element-06","Arena.Normal-Stage.Selector"],text:'{"text": "<<","color": "white","bold": true}'}
summon text_display ^1 ^1.3 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["Arena.Normal-Stage.Selector.Element-06","Arena.Normal-Stage.Selector"],text:'{"text": ">>","color": "white","bold": true}'}

# text_display: 必要AP / 最大プレイヤー数 / 報酬
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.75f,0.75f,0.75f],translation:[0.0f,0.66f,0.0f]},"alignment":"left",Tags:["Arena.Normal-Stage.Selector.Element-07","Arena.Normal-Stage.Selector"],text:'{"text": " "}'}

# 決定 
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.1f,1.1f,1.1f],translation:[0.0f,0.125f,0.0f]},"alignment":"center",Tags:["Arena.Normal-Stage.Selector.Element-05","Arena.Normal-Stage.Selector"],text:'{"text": "","extra": [{"text": "〚","color": "white","bold": true},{"text": "入場","color": "green","bold": true},{"text": "〛","color": "white","bold": true}]}'}

summon interaction ^ ^0.125 ^-0.25 {Tags:["Arena.Normal-Stage.Selector.Interaction-05","Arena.Normal-Stage.Selector"],height:0.33f,width:0.75f}

#> こまごまとした処理
# 回転
execute as @e[tag=Arena.Normal-Stage.Selector,distance=..4] run data modify entity @s Rotation set from entity @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] Rotation

# Coreのページをリセット
data modify entity @s data.Arena.SelectorPage set value {MobType:0,Difficulty:0}
function arena_normal:entrance/stage_selector/reflesh with entity @s data.Arena.SelectorPage

