## ページ繰り処理: 次へ
# トリガー解除
advancement revoke @s only arena_normal:record_dislpay/page_next/left
advancement revoke @s only arena_normal:record_dislpay/page_next/right

# 現在のページ / 最大値を取得
execute store result score #Display.Page Arena.Temp run data get entity @e[tag=Arena.Normal-Stage.Display.Core,sort=nearest,limit=1] data.Arena.Display.MobType
execute store result score #Display.Page-Max Arena.Temp run data get storage arena:assets stage_data

scoreboard players remove #Display.Page-Max Arena.Temp 1

# ± 1, しきい値を超える場合は戻す
scoreboard players add #Display.Page Arena.Temp 1

execute if score #Display.Page Arena.Temp > #Display.Page-Max Arena.Temp run scoreboard players set #Display.Page Arena.Temp 0
execute if score #Display.Page Arena.Temp matches ..-1 run scoreboard players operation #Display.Page Arena.Temp = #Display.Page-Max Arena.Temp

# マーカーに戻す
execute store result entity @e[tag=Arena.Normal-Stage.Display.Core,sort=nearest,limit=1] data.Arena.Display.MobType int 1 run scoreboard players get #Display.Page Arena.Temp

# 表示を更新
function arena_normal:recording/display/reflesh with entity @e[tag=Arena.Normal-Stage.Display.Core,sort=nearest,limit=1] data.Arena.Display

# playsound 
playsound ui.button.click master @s ~ ~ ~ 1 2
