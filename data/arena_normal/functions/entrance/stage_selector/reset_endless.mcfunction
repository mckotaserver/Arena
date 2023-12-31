## ディスプレイ表示のリセット
#> Kill
# kill
kill @e[tag=Arena.Normal-Stage.Selector,distance=..4]

#> 各種構成エンティティを再Summon
# text_display: 【通常アリーナ】

summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.25f,1.25f,1.25f],translation:[0.0f,1.6f,0.0f]},"alignment":"center",Tags:["Arena.Normal-Stage.Selector.Element-01","Arena.Normal-Stage.Selector"],text:'{"text": "","extra": [{"text": "【","color": "dark_aqua","bold": true},{"text": "エンドレスアリーナ","color": "aqua","bold": true},{"text": "】","color": "dark_aqua","bold": true}]}'}

# text_display: 必要AP / 最大プレイヤー数 / 報酬
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.75f,0.75f,0.75f],translation:[0.0f,0.75f,0.0f]},"alignment":"left",Tags:["Arena.Normal-Stage.Selector.Element-07","Arena.Normal-Stage.Selector"],text:'{"text": "","extra": [{"text": "❖ ","color": "gold"},{"text": "最大プレイヤー数: ","color": "white"},{"text": "4","color": "yellow","bold": true},{"text": "\\n❖ ","color": "gold"},{"text": "必要アリーナポイント: ","color": "white"},{"text": "2","color": "yellow","bold": true},{"text": "\\n❖ ","color": "gold"},{"text": "報酬: ","color": "white"},{"text": "変動","color": "gold","bold": true}]}'}

# 決定 
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.1f,1.1f,1.1f],translation:[0.0f,0.125f,0.0f]},"alignment":"center",Tags:["Arena.Normal-Stage.Selector.Element-05","Arena.Normal-Stage.Selector"],text:'{"text": "","extra": [{"text": "〚","color": "white","bold": true},{"text": "入場","color": "green","bold": true},{"text": "〛","color": "white","bold": true}]}'}

summon interaction ^ ^0.125 ^0.25 {Tags:["Arena.Normal-Stage.Selector.Interaction-05","Arena.Normal-Stage.Selector"],height:0.33f,width:0.75f}

#> こまごまとした処理
# 回転
execute rotated ~180 ~ as @e[tag=Arena.Normal-Stage.Selector,distance=..1] positioned as @s run tp @s ~ ~ ~ ~ ~

