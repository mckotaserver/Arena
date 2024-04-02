## チケット変換
# トリガー解除
advancement revoke @s only arena_normal:misc/inventory_changed

# チケットの個数を取得: easy
execute store result score #reward.ticket_count arena.temp run clear @s paper{CustomModelData:2000031}
execute store result score #reward.ticket_count.new arena.temp run clear @s paper{CustomModelData:2000031,arena:ticket_easy}

scoreboard players operation #reward.ticket_count arena.temp -= #reward.ticket_count.new arena.temp

loot give @s loot arena_normal:ticket/easy

# チケットの個数を取得: normal
execute store result score #reward.ticket_count arena.temp run clear @s paper{CustomModelData:2000032}
execute store result score #reward.ticket_count.new arena.temp run clear @s paper{CustomModelData:2000032,arena:ticket_normal}

scoreboard players operation #reward.ticket_count arena.temp -= #reward.ticket_count.new arena.temp

loot give @s loot arena_normal:ticket/normal

# チケットの個数を取得: hard
execute store result score #reward.ticket_count arena.temp run clear @s paper{CustomModelData:2000033}
execute store result score #reward.ticket_count.new arena.temp run clear @s paper{CustomModelData:2000033,arena:ticket_hard}

scoreboard players operation #reward.ticket_count arena.temp -= #reward.ticket_count.new arena.temp

loot give @s loot arena_normal:ticket/hard
