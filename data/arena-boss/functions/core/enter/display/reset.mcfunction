## 選択表示のリセット
# kill
kill @e[tag=ArenaBoss.StageSelector.Display-0]

kill @e[tag=ArenaBoss.StageSelector.Display-1-0]
kill @e[tag=ArenaBoss.StageSelector.Display-1-1]

kill @e[tag=ArenaBoss.StageSelector.Display-2-0]
kill @e[tag=ArenaBoss.StageSelector.Display-2-1]

kill @e[tag=ArenaBoss.StageSelector.PagePrev]
kill @e[tag=ArenaBoss.StageSelector.PageNext]

kill @e[tag=ArenaBoss.StageSelector.Display-Note]
kill @e[tag=ArenaBoss.StageSelector.Display-Page]

kill @e[tag=ArenaBoss.StageSelector.Confirm]
kill @e[tag=ArenaBoss.StageSelector.Display-Confirm]

# 再summon
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~ ~0.4 ~ {Tags:["ArenaBoss.StageSelector.Display-0"],text:'{"nbt":"Boss.StageInfo[0].Name","storage": "arena:core"}'}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~0.2 ~0.12 ~ {Tags:["ArenaBoss.StageSelector.Display-1"],text:'[{"text":"必要AP: ","color": "white","bold": true},{"nbt": "Boss.StageInfo[0].TicketRequired","storage": "arena:core","color": "aqua","bold": true}]'}
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~0.4875 ~-0.22 ~ {Tags:["ArenaBoss.StageSelector.Display-2"],text:'[{"text": "最大入場者数:", "color": "white", "bold": true},{"nbt": "Boss.StageInfo[0].PlayerMaxCount","storage": "arena:core","color": "aqua","bold": true}]'}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~ ~0.9 ~ {Tags:["ArenaBoss.StageSelector.Display-Note"],text:'{"text": "［入場ステージを選択］", "color": "red", "bold": true}'}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon interaction ~-1 ~-0.5 ~ {Tags:["ArenaBoss.StageSelector.PagePrev"]}
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon interaction ~1 ~-0.5 ~ {Tags:["ArenaBoss.StageSelector.PageNext"]}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon interaction ~ ~-0.5 ~ {Tags:["ArenaBoss.StageSelector.Confirm"]}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~-1 ~-0.66 ~ {Tags:["ArenaBoss.StageSelector.Display-Page"],text:'{"text":"<<","color": "white","bold": true}'}
execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~1 ~-0.66 ~ {Tags:["ArenaBoss.StageSelector.Display-Page"],text:'{"text":">>","color": "white","bold": true}'}

execute at @e[tag=ArenaBoss.StageSelector.Core] run summon text_display ~ ~-0.66 ~ {Tags:["ArenaBoss.StageSelector.Display-Confirm"],text:'{"text": "［決定］", "color": "green", "bold": true}',width:1.0}

# ページ繰り用データの設定
data modify storage arena:temp Boss.StageInfo set from storage arena:core Boss.StageInfo
