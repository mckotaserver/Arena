## モブ種類 > ページ繰り
# トリガー解除
advancement revoke @s only arena_boss:stage_selector/on_click/boss_stage/page_prev/left
advancement revoke @s only arena_boss:stage_selector/on_click/boss_stage/page_prev/right

#> 表示設定: mob_type
# 値を変更 (Prev: -1)
execute store result score #SelectorData.Value Arena.Temp run data get entity @e[tag=Arena.Boss.Selector.Core,sort=nearest,limit=1] data.Arena.SelectorPage.BossStage
scoreboard players remove #SelectorData.Value Arena.Temp 1

# 上限・下限を超えた場合は 0 / MAX に設定
execute store result score #SelectorData.Max Arena.Temp run data get storage arena:assets boss_data
scoreboard players remove #SelectorData.Max Arena.Temp 1

execute if score #SelectorData.Value Arena.Temp matches -1 run scoreboard players operation #SelectorData.Value Arena.Temp = #SelectorData.Max Arena.Temp 

# Coreにデータを戻す
execute store result entity @e[tag=Arena.Boss.Selector.Core,sort=nearest,limit=1] data.Arena.SelectorPage.BossStage int 1 run scoreboard players get #SelectorData.Value Arena.Temp

# 値に合わせて表示を更新
execute as @e[tag=Arena.Boss.Selector.Core,sort=nearest,limit=1] at @s run function arena_boss:core/entrance/stage_selector/reflesh with entity @s data.Arena.SelectorPage

#> sound
playsound ui.button.click master @s ~ ~ ~ 1 1.5

