## ページ繰り処理: 次へ
# トリガー解除
advancement revoke @s only arena_normal:record_dislpay/page_next/left
advancement revoke @s only arena_normal:record_dislpay/page_next/right

# 現在のページ / 最大値を取得
execute store result score #display.page arena.temp run data get entity @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] data.arena.display.mob_type
execute store result score #display.page-max arena.temp run data get storage arena:assets stage_data

scoreboard players remove #display.page-max arena.temp 1

# ± 1, しきい値を超える場合は戻す
scoreboard players add #display.page arena.temp 1

execute if score #display.page arena.temp > #display.page-max arena.temp run scoreboard players set #display.page arena.temp 0
execute if score #display.page arena.temp matches ..-1 run scoreboard players operation #display.page arena.temp = #display.page-max arena.temp

# マーカーに戻す
execute store result entity @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] data.arena.display.mob_type int 1 run scoreboard players get #display.page arena.temp

# 表示を更新
function arena_normal:misc/data_search with entity @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] data.arena.display

function arena_normal:recording/display/reflesh with storage arena_normal:temp stage_data_searching.out

# playsound 
playsound ui.button.click master @s ~ ~ ~ 1 2
