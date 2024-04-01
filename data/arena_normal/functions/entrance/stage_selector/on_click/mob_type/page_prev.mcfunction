## モブ種類 > ページ繰り
# トリガー解除
advancement revoke @s only arena_normal:stage_selector/on_click/mob_type/page_prev/left
advancement revoke @s only arena_normal:stage_selector/on_click/mob_type/page_prev/right

#> 表示設定: mob_type
# 値を変更 (prev: -1)
execute store result score #selectorData.Value arena.temp run data get entity @e[tag=arena.normal_stage.selector_core,sort=nearest,limit=1] data.arena.selector_page.mob_type
scoreboard players remove #selectorData.Value arena.temp 1

# 上限・下限を超えた場合は 0 / MAX に設定
execute store result score #selectorData.Max arena.temp run data get storage arena:assets stage_data
scoreboard players remove #selectorData.Max arena.temp 1

    # エンドレスが選択できないよう
    scoreboard players remove #selectorData.Max arena.temp 1

execute if score #selectorData.Value arena.temp matches -1 run scoreboard players operation #selectorData.Value arena.temp = #selectorData.Max arena.temp 

# Coreにデータを戻す
execute store result entity @e[tag=arena.normal_stage.selector_core,sort=nearest,limit=1] data.arena.selector_page.mob_type int 1 run scoreboard players get #selectorData.Value arena.temp

# 値に合わせて表示を更新
execute at @e[tag=arena.normal_stage.selector_core,sort=nearest,limit=1] run function arena_normal:entrance/stage_selector/reflesh with entity @e[tag=arena.normal_stage.selector_core,sort=nearest,limit=1] data.arena.selector_page


#> sound
playsound ui.button.click master @s ~ ~ ~ 1 1.5

