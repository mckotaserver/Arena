## モブ種類 > ページ繰り
# トリガー解除
advancement revoke @s only arena_boss:stage_selector/on_click/boss_stage/page_prev/left
advancement revoke @s only arena_boss:stage_selector/on_click/boss_stage/page_prev/right

#> 表示設定: mob_type
# 値を変更 (Prev: -1)
execute store result score #SelectorData.Value arena.temp run data get entity @e[tag=arena.boss.Selector.Core,sort=nearest,limit=1] data.arena.SelectorPage.bossStage
scoreboard players remove #SelectorData.Value arena.temp 1

# 上限・下限を超えた場合は 0 / MAX に設定
execute store result score #SelectorData.Max arena.temp run data get storage arena:assets boss_data
scoreboard players remove #SelectorData.Max arena.temp 1

execute if score #SelectorData.Value arena.temp matches -1 run scoreboard players operation #SelectorData.Value arena.temp = #SelectorData.Max arena.temp 

# Coreにデータを戻す
execute store result entity @e[tag=arena.boss.Selector.Core,sort=nearest,limit=1] data.arena.SelectorPage.bossStage int 1 run scoreboard players get #SelectorData.Value arena.temp

# 値に合わせて表示を更新
execute as @e[tag=arena.boss.Selector.Core,sort=nearest,limit=1] at @s run function arena_boss:core/entrance/stage_selector/reflesh with entity @s data.arena.SelectorPage

#> sound
playsound ui.button.click master @s ~ ~ ~ 1 1.5

