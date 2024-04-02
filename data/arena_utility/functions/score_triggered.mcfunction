## トリガー時 共有処理
# 特定の桁の値で分岐
    # 10000 ~ 19999 → quest
        # クエスト一覧表示
            execute if score @s arena.trigger matches 11000..11999 run data modify storage arena_quests:temp display.detailed.type set value "daily"
            execute if score @s arena.trigger matches 12000..12999 run data modify storage arena_quests:temp display.detailed.type set value "weekly"

        execute if score @s arena.trigger matches 11000..12999 run function arena_utility:quests/display/text_clicked with storage arena_quests:temp display.detailed

# スコアのリセット
scoreboard players reset @s arena.trigger 

# 効果音
playsound ui.button.click master @s ~ ~ ~ 1 2
