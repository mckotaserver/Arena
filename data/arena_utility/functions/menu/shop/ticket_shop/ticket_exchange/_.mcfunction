## チケット変換
# 必要数持っているか判定
$execute store result score #utility.shop.ticket_exchange.player arena.temp run clear @s paper{arena:"ticket_$(from)"} 0

$execute store result score #utility.shop.ticket_exchange.required arena.temp run data get storage arena:assets utility.menu.ticket_exchange[{from:{ticket:$(from)},to:{ticket:$(to)}}].from.count

execute unless score #utility.shop.ticket_exchange.player arena.temp >= #utility.shop.ticket_exchange.required arena.temp run playsound ui.button.click master @s ~ ~ ~ 1 0.5

execute unless score #utility.shop.ticket_exchange.player arena.temp >= #utility.shop.ticket_exchange.required arena.temp run return 0

# アイテムをclear
execute store result storage arena_utility:temp shop.ticket_exchange.count_from int 1 run scoreboard players get #utility.shop.ticket_exchange.required arena.temp
$data modify storage arena_utility:temp shop.ticket_exchange.ticket_from set value "$(from)"

function arena_utility:menu/shop/ticket_shop/ticket_exchange/macro with storage arena_utility:temp shop.ticket_exchange

# 変換先のアイテムをloot spawn
$execute store result score #reward.ticket_count arena.temp run data get storage arena:assets utility.menu.ticket_exchange[{from:{ticket:$(from)},to:{ticket:$(to)}}].to.count

$loot spawn ~ ~ ~ loot arena_normal:ticket/$(to)
execute as @e[type=item,distance=..2] run data modify entity @s PickupDelay set value 0

# playsound 
playsound block.note_block.pling master @s ~ ~ ~ 1 2
playsound entity.player.levelup master @s ~ ~ ~ 1 2
playsound ui.button.click master @s ~ ~ ~ 1 2
