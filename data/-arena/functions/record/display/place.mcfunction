# ランキング表示ディスプレイ設置
# マーカー設置
summon marker ~ ~ ~ {Tags:["Arena.RankingDisplay.Core"],Rotation:[-90.0f,0.0f]}

# ページ変更ボタン
execute at @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] run summon interaction ^-1 ^ ^ {Tags:["Arena.RankingDisplay.PagePrev"]}
execute at @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] run summon interaction ^1 ^ ^ {Tags:["Arena.RankingDisplay.PageNext"]}

execute at @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] run summon text_display ^-1 ^ ^ {Tags:["Arena.RankingDisplay.PageNote"],text:'{"text":"<<","color": "white","bold": true}'}
execute at @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] run summon text_display ^1 ^ ^ {Tags:["Arena.RankingDisplay.PageNote"],text:'{"text":">>","color": "white","bold": true}'}

# 説明
execute at @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] run summon text_display ~ ~0.1 ~ {Tags:["Arena.RankingDisplay.Note-Exp"],text:'{"text":"通常アリーナについては、\\nハードモード・ソロクリア時に\\nタイムが掲載されます。","color": "green","bold": true}'}

# データ読み込み
execute as @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] at @s run function arena:record/display/reflesh

