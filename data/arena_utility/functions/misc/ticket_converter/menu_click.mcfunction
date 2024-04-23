## チケット変換器
# playsound
playsound ui.button.click master @s ~ ~ ~ 1 2

# 各枚数をチェック
execute store result storage arena_utility:temp misc.ticket_converter.count_easy int 1 run clear @s paper{CustomModelData:2000031}
execute store result storage arena_utility:temp misc.ticket_converter.count_normal int 1 run clear @s paper{CustomModelData:2000032}
execute store result storage arena_utility:temp misc.ticket_converter.count_hard int 1 run clear @s paper{CustomModelData:2000033}

# 交換ないよ！
execute if data storage arena_utility:temp {misc:{ticket_converter:{count_easy:0,count_normal:0,count_hard:0}}} run tellraw @s [{"text": "交換可能なチケットが見つかりませんでした。","color": "red"}]
execute if data storage arena_utility:temp {misc:{ticket_converter:{count_easy:0,count_normal:0,count_hard:0}}} run playsound block.note_block.pling master @s ~ ~ ~ 0.5 0.5


# give → 一括でやると個数0のときにエラー、こうするしかない？
    # easy
    data modify storage arena_utility:temp misc.ticket_converter.data set value {arena:ticket_easy,CustomModelData:2000031,display:{Lore:['{"italic":false,"color":"white","text":"アリーナのショップでの交換に使えるチケット。"}'],Name:'{"italic":false,"color":"gold","extra":[{"italic":false,"color":"green","text":"【初級】"}],"text":"アリーナチケット"}'}}
    data modify storage arena_utility:temp misc.ticket_converter.count set from storage arena_utility:temp misc.ticket_converter.count_easy

    execute unless data storage arena_utility:temp {misc:{ticket_converter:{count_easy:0}}} run function arena_utility:misc/ticket_converter/give with storage arena_utility:temp misc.ticket_converter

    # normal
    data modify storage arena_utility:temp misc.ticket_converter.data set value {arena:ticket_normal,CustomModelData:2000032,display:{Lore:['{"italic":false,"color":"white","text":"アリーナのショップでの交換に使えるチケット。"}'],Name:'{"italic":false,"color":"gold","extra":[{"italic":false,"color":"yellow","text":"【中級】"}],"text":"アリーナチケット"}'}}
    data modify storage arena_utility:temp misc.ticket_converter.count set from storage arena_utility:temp misc.ticket_converter.count_normal

    execute unless data storage arena_utility:temp {misc:{ticket_converter:{count_normal:0}}} run function arena_utility:misc/ticket_converter/give with storage arena_utility:temp misc.ticket_converter

    # hard
    data modify storage arena_utility:temp misc.ticket_converter.data set value {arena:ticket_hard,CustomModelData:2000033,display:{Lore:['{"italic":false,"color":"white","text":"アリーナのショップでの交換に使えるチケット。"}'],Name:'{"italic":false,"color":"gold","extra":[{"italic":false,"color":"red","text":"【上級】"}],"text":"アリーナチケット"}'}}
    data modify storage arena_utility:temp misc.ticket_converter.count set from storage arena_utility:temp misc.ticket_converter.count_hard

    execute unless data storage arena_utility:temp {misc:{ticket_converter:{count_hard:0}}} run function arena_utility:misc/ticket_converter/give with storage arena_utility:temp misc.ticket_converter

# 効果音
playsound block.note_block.pling master @s ~ ~ ~ 1 2
