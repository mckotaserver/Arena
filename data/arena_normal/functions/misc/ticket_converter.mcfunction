## チケット変換
# トリガー解除
advancement revoke @s only arena_normal:misc/inventory_changed

# チケットの個数を取得: easy
execute store result score #reward.ticket_count arena.temp run clear @s paper{CustomModelData:2000031,arena:Ticket-Easy} 0
clear @s paper{CustomModelData:2000031,arena:Ticket-Easy} 64
loot give @s loot arena_normal:ticket/easy

# チケットの個数を取得: easy
execute store result score #reward.ticket_count arena.temp run clear @s paper{CustomModelData:2000031,arena:Ticket-Easy} 0
clear @s paper{CustomModelData:2000031,arena:Ticket-Easy} 64
loot give @s loot arena_normal:ticket/easy

# チケットの個数を取得: easy
execute store result score #reward.ticket_count arena.temp run clear @s paper{CustomModelData:2000031,arena:Ticket-Easy} 0
clear @s paper{CustomModelData:2000031,arena:Ticket-Easy} 64
loot give @s loot arena_normal:ticket/easy


