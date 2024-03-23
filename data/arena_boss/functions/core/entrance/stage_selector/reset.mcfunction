## ディスプレイ表示のリセット
#> Kill
# kill
kill @e[tag=arena.boss.Selector]

#> 各種構成エンティティを再Summon
# text_display: 【ボスアリーナ】
summon text_display ^ ^1.75 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.25f,1.25f,1.25f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["arena.boss.Selector.Element-01","arena.boss.Selector"],text:'{"text": "","extra": [{"text": "【","color": "dark_purple","bold": true},{"text": "ボスアリーナ","color": "light_purple","bold": true},{"text": "】","color": "dark_purple","bold": true}]}'}

# モブ種類 / ナンイド選択 text_display: <<［null］>>, interaction, text_display: <<［null］>>, interaction 
summon text_display ^ ^1.33 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["arena.boss.Selector.Element-04","arena.boss.Selector"],text:''}

summon interaction ^0.75 ^0.5 ^ {Tags:["arena.boss.Selector.Interaction-01","arena.boss.Selector"],height:0.2f,width:0.25f}
summon interaction ^-0.75 ^0.5 ^ {Tags:["arena.boss.Selector.Interaction-02","arena.boss.Selector"],height:0.2f,width:0.25f}

summon text_display ^-0.75 ^0.5 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["arena.boss.Selector.Element-06","arena.boss.Selector"],text:'{"text": "<<","color": "white","bold": true}'}
summon text_display ^0.75 ^0.5 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.87f,0.87f,0.87f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["arena.boss.Selector.Element-06","arena.boss.Selector"],text:'{"text": ">>","color": "white","bold": true}'}

# text_display: 必要AP / 最大プレイヤー数
summon text_display ^ ^0.875 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.75f,0.75f,0.75f],translation:[0.0f,0.0f,0.0f]},"alignment":"left",Tags:["arena.boss.Selector.Element-07","arena.boss.Selector"],text:'{"text": " "}'}

# 決定 
summon text_display ^ ^0.375 ^ {"transformation":{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.1f,1.1f,1.1f],translation:[0.0f,0.0f,0.0f]},"alignment":"center",Tags:["arena.boss.Selector.Element-05","arena.boss.Selector"],text:'{"text": "","extra": [{"text": "〚","color": "white","bold": true},{"text": "入場","color": "green","bold": true},{"text": "〛","color": "white","bold": true}]}'}

summon interaction ^ ^0.375 ^-0.25 {Tags:["arena.boss.Selector.Interaction-05","arena.boss.Selector"],height:0.33f,width:0.75f}

#> こまごまとした処理
# 回転
execute as @e[tag=arena.boss.Selector,distance=..4] run data modify entity @s Rotation set from entity @e[tag=arena.boss.Selector.Core,sort=nearest,limit=1] Rotation

# Coreのページをリセット
data modify entity @s data.Arena.SelectorPage set value {bossStage:0}
function arena_boss:core/entrance/stage_selector/reflesh with entity @s data.Arena.SelectorPage
