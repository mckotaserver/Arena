## ディスプレイ表示のリセット
#> Kill
# kill
kill @e[tag=arena.normal_stage.Selector,distance=..4]

#> 各種構成エンティティを再Summon
# text_display: 【通常アリーナ】
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.25f,1.25f,1.25f],translation:[0.0f,1.5f,0.0f]},"alignment":"center",Tags:["arena.normal_stage.Selector.Element-01","arena.normal_stage.Selector"],text:'{"text": "","extra": [{"text": "【","color": "dark_aqua","bold": true},{"text": "エンドレスアリーナ","color": "aqua","bold": true},{"text": "】","color": "dark_aqua","bold": true}]}'}

# text_display: 必要AP / 最大プレイヤー数 / 報酬
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.75f,0.75f,0.75f],translation:[0.0f,0.75f,0.0f]},"alignment":"left",Tags:["arena.normal_stage.Selector.Element-07","arena.normal_stage.Selector"],text:'{"text": "","extra": [{"text": "❖ ","color": "gold"},{"text": "最大プレイヤー数: ","color": "white"},{"text": "4","color": "yellow","bold": true},{"text": "\\n❖ ","color": "gold"},{"text": "必要アリーナポイント: ","color": "white"},{"text": "2","color": "yellow","bold": true},{"text": "\\n❖ ","color": "gold"},{"text": "報酬: ","color": "white"},{"text": "変動","color": "gold","bold": true}]}'}

# 決定 
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.1f,1.1f,1.1f],translation:[0.0f,0.125f,0.0f]},"alignment":"center",Tags:["arena.normal_stage.Selector.Element-05","arena.normal_stage.Selector"],text:'{"text": "","extra": [{"text": "〚","color": "white","bold": true},{"text": "入場","color": "green","bold": true},{"text": "〛","color": "white","bold": true}]}'}

summon interaction ^ ^0.125 ^-0.25 {Tags:["arena.normal_stage.Selector.Interaction-05","arena.normal_stage.Selector"],height:0.33f,width:0.75f}

#> こまごまとした処理
# 回転
execute as @e[tag=arena.normal_stage.Selector,distance=..4] run data modify entity @s Rotation set from entity @e[tag=arena.normal_stage.Selector-Core,sort=nearest,limit=1] Rotation


