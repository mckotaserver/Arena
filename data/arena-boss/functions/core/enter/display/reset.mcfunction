## 選択表示のリセット
# kill
kill @e[tag=ArenaBoss.StageSelector.Display-0]
kill @e[tag=ArenaBoss.StageSelector.Display-1]
kill @e[tag=ArenaBoss.StageSelector.Display-2]

kill @e[tag=ArenaBoss.StageSelector.PagePrev]
kill @e[tag=ArenaBoss.StageSelector.PageNext]

kill @e[tag=ArenaBoss.StageSelector.Display-Note]
kill @e[tag=ArenaBoss.StageSelector.Display-Page]

kill @e[tag=ArenaBoss.StageSelector.Confirm]
kill @e[tag=ArenaBoss.StageSelector.Display-Confirm]

# ページ繰り用データ
data modify storage arena:temp Boss.StageInfo set from storage arena:core Boss.StageInfo

# 再summon
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~ ~0.9 ~ {Tags:["ArenaBoss.StageSelector.Display-Note"],text:'{"text": "［入場ステージを選択］", "color": "red", "bold": true}'}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~ ~0.4 ~ {Tags:["ArenaBoss.StageSelector.Display-0"],text:'{"nbt":"Boss.StageInfo[0].Name","storage": "arena:core","interpret": true}',transformation:{scale:[1.25f,1.25f,1.25f]}}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~ ~-0.2 ~ {Tags:["ArenaBoss.StageSelector.Display-1"],text:'[{"text":"必要AP: ","color": "white","bold": true},{"nbt": "Boss.StageInfo[0].TicketRequired","storage": "arena:core","color": "aqua","bold": true},{"text": "\\n最大入場者数: ", "color": "white", "bold": true},{"nbt": "Boss.StageInfo[0].MaxPlayerCount","storage": "arena:core","color": "aqua","bold": true}]',alignment:"left",transformation:{scale:[0.75f,0.75f,0.75f]}}

data modify entity @e[tag=ArenaBoss.StageSelector.Display-1,limit=1] transformation.scale[] set value 0.85f

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon interaction ~-1 ~-0.65 ~ {Tags:["ArenaBoss.StageSelector.PagePrev"],width:0.35f,height:0.3f}
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon interaction ~1 ~-0.65 ~ {Tags:["ArenaBoss.StageSelector.PageNext"],width:0.35f,height:0.3f}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon interaction ~-0.3 ~-0.65 ~ {Tags:["ArenaBoss.StageSelector.Confirm"],width:0.3f,height:0.3f}
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon interaction ~ ~-0.65 ~ {Tags:["ArenaBoss.StageSelector.Confirm"],width:0.3f,height:0.3f}
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon interaction ~0.3 ~-0.65 ~ {Tags:["ArenaBoss.StageSelector.Confirm"],width:0.3f,height:0.3f}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~-1 ~-0.66 ~ {Tags:["ArenaBoss.StageSelector.Display-Page"],text:'{"text":"<<","color": "white","bold": true}'}
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~1 ~-0.66 ~ {Tags:["ArenaBoss.StageSelector.Display-Page"],text:'{"text":">>","color": "white","bold": true}'}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~ ~-0.66 ~ {Tags:["ArenaBoss.StageSelector.Display-Confirm"],text:'{"text": "［決定］", "color": "green", "bold": true}',width:1.0}


