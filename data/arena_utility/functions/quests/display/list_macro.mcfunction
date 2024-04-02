## リスト表示 アイテムごと
# メイン
$execute if data storage arena_quests:temp {display:{list:{macro:{type:"daily"}}}} run tellraw @s [{"translate":"kota-server.arena.quests.message.list_item","with":[{"translate":"kota-server.arena.quests.$(id).name","hoverEvent":{"action": "show_text","contents": [{"text":"[","color":"white"},{"translate":"kota-server.arena.quests.$(id).description"},{"text":"]","color":"white"},{"text":"\nクリックして詳細を表示"}]},"clickEvent": {"action": "run_command","value": "/trigger arena.trigger add 1100$(index)"}}]}]
$execute if data storage arena_quests:temp {display:{list:{macro:{type:"weekly"}}}} run tellraw @s [{"translate":"kota-server.arena.quests.message.list_item","with":[{"translate":"kota-server.arena.quests.$(id).name","hoverEvent":{"action": "show_text","contents": [{"text":"[","color":"white"},{"translate":"kota-server.arena.quests.$(id).description"},{"text":"]","color":"white"},{"text":"\nクリックして詳細を表示"}]},"clickEvent": {"action": "run_command","value": "/trigger arena.trigger add 1200$(index)"}}]}]

# 次の表示のidを設定
$data modify storage arena_quests:temp display.list.macro.id set from storage arena:quests $(type)[$(index)].id

# index = index + 1
$scoreboard players set #quests.display.list.index arena.temp $(index)
execute store result storage arena_quests:temp display.list.macro.index int 1 run scoreboard players add #quests.display.list.index arena.temp 1

# 再起
    # 残り項数を -1
    execute store result storage arena_quests:temp display.list.items_left int 0.999 run data get storage arena_quests:temp display.list.items_left

    # 残り0でなければ再起
    execute unless data storage arena_quests:temp {display:{list:{items_left:0}}} run function arena_utility:quests/display/list_macro with storage arena_quests:temp display.list.macro

