# ページ戻り処理
# トリガー解除
advancement revoke @s only arena-boss:stage_entering/left/page_prev
advancement revoke @s only arena-boss:stage_entering/right/page_prev

# ページ数の変更
execute store result score $Page ArenaBoss.Temp run data get entity @e[tag=ArenaBoss.StageSelector.Core,limit=1] data.Arena.Page
scoreboard players remove $Page ArenaBoss.Temp 1

execute store result score $StageCount ArenaBoss.Temp run data get storage arena:core Boss.StageInfo
scoreboard players remove $StageCount ArenaBoss.Temp 1

execute if score $Page ArenaBoss.Temp matches -1 run scoreboard players operation $Page ArenaBoss.Temp = $StageCount ArenaBoss.Temp

execute store result entity @e[tag=ArenaBoss.StageSelector.Core,limit=1] data.Arena.Page int 1 run scoreboard players get $Page ArenaBoss.Temp

# 表示内容更新
data modify storage arena:temp Boss.StageInfo append from storage arena:temp Boss.StageInfo[0]
data remove storage arena:temp Boss.StageInfo[0]

data modify entity @e[tag=ArenaBoss.StageSelector.Display-0,limit=1] text set from storage arena:temp Boss.StageInfo[0].Name
data modify entity @e[tag=ArenaBoss.StageSelector.Display-1,limit=1] text set value '[{"text":"必要AP: ","color": "white","bold": true},{"nbt": "Boss.StageInfo[0].TicketRequired","storage": "arena:temp","color": "aqua","bold": true},{"text": "\\n最大入場者数: ", "color": "white", "bold": true},{"nbt": "Boss.StageInfo[0].MaxPlayerCount","storage": "arena:temp","color": "aqua","bold": true}]'

# 演出
playsound ui.button.click master @a ~ ~ ~ 1 1
