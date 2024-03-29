## モブ種類 > ページ戻り
# トリガー解除
advancement revoke @s only arena_normal:stage_selector/on_click/difficulty/page_next/left
advancement revoke @s only arena_normal:stage_selector/on_click/difficulty/page_next/right

#> 表示設定: difficulty
# 値を変更 (next: +1)
execute store result score #SelectorData.Value arena.temp run data get entity @e[tag=arena.normal_stage.Selector-Core,sort=nearest,limit=1] data.arena.SelectorPage.difficulty
scoreboard players add #SelectorData.Value arena.temp 1

# 上限・下限を超えた場合は 0 / MAX に設定
execute store result score #SelectorData.Max arena.temp run data get storage arena:assets stage_difficulty
scoreboard players remove #SelectorData.Max arena.temp 1

execute if score #SelectorData.Value arena.temp > #SelectorData.Max arena.temp run scoreboard players set #SelectorData.Value arena.temp 0

# Coreにデータを戻す
execute store result entity @e[tag=arena.normal_stage.Selector-Core,sort=nearest,limit=1] data.arena.SelectorPage.difficulty int 1 run scoreboard players get #SelectorData.Value arena.temp

# 値に合わせて表示を更新
execute at @e[tag=arena.normal_stage.Selector-Core,sort=nearest,limit=1] run function arena_normal:entrance/stage_selector/reflesh with entity @e[tag=arena.normal_stage.Selector-Core,sort=nearest,limit=1] data.arena.SelectorPage


#> sound
playsound ui.button.click master @s ~ ~ ~ 1 2
