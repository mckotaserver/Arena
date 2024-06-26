## ディスプレイ表示のリセット
#> Kill
# kill
kill @e[tag=arena.normal_stage.selector,type=!marker,distance=..4]

#> 各種構成エンティティを再Summon
# text_display: 【通常アリーナ】
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.25f,1.25f,1.25f],translation:[0.0f,2.0f,0.0f]},"alignment":"center",Tags:["arena.normal_stage.selector.element_01","arena.normal_stage.selector"],text:'{"text": "","extra": [{"text": "【","color": "aqua","bold": true},{"text": "通常アリーナ","color": "yellow","bold": true},{"text": "】","color": "aqua","bold": true}]}'}

# モブ種類 / ナンイド選択 text_display: <<［null］>>, interaction, text_display: <<［null］>>, interaction 
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,1.33f,0.0f]},"alignment":"center",Tags:["arena.normal_stage.selector.element_04","arena.normal_stage.selector"],text:'{"text": "","extra": [{"text": "［","color": "white","bold": true},{"text": "null","color": "yellow","bold": true},{"text": "］","color": "white","bold": true},{"text": "\\n［","color": "white","bold": true},{"text": "null","color": "yellow","bold": true},{"text": "］","color": "white","bold": true}]}'}

summon interaction ^1 ^1.6 ^ {Tags:["arena.normal_stage.selector.interaction_01","arena.normal_stage.selector"],height:0.2f,width:0.25f}
summon interaction ^-1 ^1.6 ^ {Tags:["arena.normal_stage.selector.interaction_02","arena.normal_stage.selector"],height:0.2f,width:0.25f}

summon interaction ^1 ^1.36 ^ {Tags:["arena.normal_stage.selector.interaction_03","arena.normal_stage.selector"],height:0.2f,width:0.25f}
summon interaction ^-1 ^1.36 ^ {Tags:["arena.normal_stage.selector.interaction_04","arena.normal_stage.selector"],height:0.2f,width:0.25f}

summon text_display ^-1 ^1.575 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["arena.normal_stage.selector.element_06","arena.normal_stage.selector"],text:'{"text": "<<","color": "white","bold": true}'}
summon text_display ^1 ^1.575 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["arena.normal_stage.selector.element_06","arena.normal_stage.selector"],text:'{"text": ">>","color": "white","bold": true}'}

summon text_display ^-1 ^1.3 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["arena.normal_stage.selector.element_06","arena.normal_stage.selector"],text:'{"text": "<<","color": "white","bold": true}'}
summon text_display ^1 ^1.3 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["arena.normal_stage.selector.element_06","arena.normal_stage.selector"],text:'{"text": ">>","color": "white","bold": true}'}

# text_display: 必要AP / 最大プレイヤー数 / 報酬
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.75f,0.75f,0.75f],translation:[0.0f,0.66f,0.0f]},"alignment":"left",Tags:["arena.normal_stage.selector.element_07","arena.normal_stage.selector"],text:'{"text": " "}'}

# 決定 
summon text_display ~ ~ ~ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.1f,1.1f,1.1f],translation:[0.0f,0.125f,0.0f]},"alignment":"center",Tags:["arena.normal_stage.selector.element_05","arena.normal_stage.selector"],text:'{"text": "","extra": [{"text": "〚","color": "white","bold": true},{"text": "入場","color": "green","bold": true},{"text": "〛","color": "white","bold": true}]}'}

summon interaction ^ ^0.125 ^-0.25 {Tags:["arena.normal_stage.selector.interaction_05","arena.normal_stage.selector"],height:0.33f,width:0.75f}

#> こまごまとした処理
# 回転
execute as @e[tag=arena.normal_stage.selector,distance=..4] run data modify entity @s Rotation set from entity @e[tag=arena.normal_stage.selector_core,sort=nearest,limit=1] Rotation

# Coreのページをリセット
data modify entity @s data.arena.selector_page set value {mob_type:0,difficulty:0}
function arena_normal:entrance/stage_selector/reflesh with entity @s data.arena.selector_page

