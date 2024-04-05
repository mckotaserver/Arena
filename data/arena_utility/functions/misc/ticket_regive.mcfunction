
execute store result score #reward.ticket_count arena.temp run clear @s paper{CustomModelData:2000031} 64
loot give @s loot arena_normal:ticket/easy

execute store result score #reward.ticket_count arena.temp run clear @s paper{CustomModelData:2000032} 64
loot give @s loot arena_normal:ticket/normal

execute store result score #reward.ticket_count arena.temp run clear @s paper{CustomModelData:2000033} 64
loot give @s loot arena_normal:ticket/hard

playsound block.note_block.pling master @s ~ ~ ~ 1 1

tellraw @s {"text": "インベントリ内のチケットを更新しました。更新の必要があるチケットが64個以上ある場合、複数回に分けてご利用ください。","color": "gold"}
