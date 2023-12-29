## モブ種類 > ページ繰り
# トリガー解除
advancement revoke @s only arena_normal:stage_selector/on_click/mob_type/page_next/left
advancement revoke @s only arena_normal:stage_selector/on_click/mob_type/page_next/right

#> 表示設定: mob_type
# 値を変更 (Next: +1)
execute store result score #SelectorData.Value Arena.Temp run data get entity @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] data.Arena.SelectorPage.MobType
scoreboard players add #SelectorData.Value Arena.Temp 1

# 上限・下限を超えた場合は 0 / MAX に設定
execute store result score #SelectorData.Max Arena.Temp run data get storage arena:assets stage_data
scoreboard players remove #SelectorData.Max Arena.Temp 1

execute if score #SelectorData.Value Arena.Temp > #SelectorData.Max Arena.Temp run scoreboard players set #SelectorData.Value Arena.Temp 0

# Coreにデータを戻す
execute store result entity @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] data.Arena.SelectorPage.MobType int 1 run scoreboard players get #SelectorData.Value Arena.Temp

# 値に合わせて表示を更新
execute at @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] run function arena_normal:entrance/stage_selector/reflesh with entity @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] data.Arena.SelectorPage


#> sound
playsound ui.button.click master @s ~ ~ ~ 1 2
