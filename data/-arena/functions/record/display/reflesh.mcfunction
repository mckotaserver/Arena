## ランキングディスプレイ 再読み込み
# 表示をリセット
# kill
kill @e[tag=Arena.RankingDisplay-Note]
kill @e[tag=Arena.RankingDisplay]

# 各種表示用エンティティ召喚
summon text_display ~ ~2.75 ~ {Tags:["Arena.RankingDisplay.Note-0","Arena.RankingDisplay-Note"],text:'{"text":" ","color": "red","bold": true}'}
summon text_display ~ ~2.5 ~ {Tags:["Arena.RankingDisplay.Note-1","Arena.RankingDisplay-Note"],text:'{"text":" ","color": "gold","bold": true}'}

summon text_display ~ ~ ~ {Tags:["Arena.RankingDisplay-0","Arena.RankingDisplay"],text:'[{"nbt":"Ranking[0]","storage": "arena:temp","interpret": true},"\\n",{"nbt":"Ranking[1]","storage": "arena:temp","interpret": true},"\\n",{"nbt":"Ranking[2]","storage": "arena:temp","interpret": true}]'}

# 表示データを取得
data modify storage arena:temp Ranking set value []

execute if data entity @s {data:{Arena:{RankingDisplay:{Page:0}}}} run data modify storage arena:temp Ranking set from storage arena: Ranking.Zombie
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:1}}}} run data modify storage arena:temp Ranking set from storage arena: Ranking.Skeleton
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:2}}}} run data modify storage arena:temp Ranking set from storage arena: Ranking.Blaze
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:3}}}} run data modify storage arena:temp Ranking set from storage arena: Ranking.Spider
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:4}}}} run data modify storage arena:temp Ranking set from storage arena: Ranking.Slime
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:5}}}} run data modify storage arena:temp Ranking set from storage arena: Ranking.Creeper
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:6}}}} run data modify storage arena:temp Ranking set from storage arena: Ranking.Guardian

execute if data entity @s {data:{Arena:{RankingDisplay:{Page:7}}}} run data modify storage arena:temp Ranking set from storage arena: Ranking.Endless

# データがなければ表示削除
execute unless data storage arena:temp Ranking[4] run kill @e[tag=Arena.RankingDisplay-4]
execute unless data storage arena:temp Ranking[3] run kill @e[tag=Arena.RankingDisplay-3]
execute unless data storage arena:temp Ranking[2] run kill @e[tag=Arena.RankingDisplay-2]
execute unless data storage arena:temp Ranking[0] run kill @e[tag=Arena.RankingDisplay-0]

execute unless data storage arena:temp Ranking[1] if data storage arena:temp Ranking[0] run kill @e[tag=Arena.RankingDisplay-1]
execute unless data storage arena:temp Ranking[0] run data modify entity @e[tag=Arena.RankingDisplay-1,limit=1] text set value '{"text":"記録なし","color": "gray","bold": true}'


# 上の表示
function arena:record/display/prepare_note
