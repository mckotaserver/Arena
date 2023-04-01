## 古いチケットを最新のものに変換
# データリセット
data modify storage arena:temp TicketExchange set value {}

# 変換対象アイテムのそれぞれ所持数取得、/lootでその数だけ付与
#Memo: /loot giveは一度に64個までしかスポーンできないようなので、合計が64個より多くならないように調整(どうにかしたい)
    # Easy
    scoreboard players set $TicketCount Arena.Temp 0

    execute store result score $TicketCount-DataDef Arena.Temp run clear @s paper{Arena:Ticket1} 32
    execute store result score $TicketCount-CMDDef Arena.Temp run clear @s paper{CustomModelData:320001} 32

    scoreboard players operation $TicketCount Arena.Temp += $TicketCount-DataDef Arena.Temp
    scoreboard players operation $TicketCount Arena.Temp += $TicketCount-CMDDef Arena.Temp
    
    execute store result storage arena:temp TicketExchange.Easy int 1 run scoreboard players get $TicketCount Arena.Temp

    execute at @p run loot spawn ~ ~ ~ loot arena:ticket/easy

    # Normal
    scoreboard players set $TicketCount Arena.Temp 0

    execute store result score $TicketCount-DataDef Arena.Temp run clear @s paper{Arena:Ticket2} 32
    execute store result score $TicketCount-CMDDef Arena.Temp run clear @s paper{CustomModelData:320002} 32

    scoreboard players operation $TicketCount Arena.Temp += $TicketCount-DataDef Arena.Temp
    scoreboard players operation $TicketCount Arena.Temp += $TicketCount-CMDDef Arena.Temp
    
    execute store result storage arena:temp TicketExchange.Normal int 1 run scoreboard players get $TicketCount Arena.Temp

    execute at @p run loot spawn ~ ~ ~ loot arena:ticket/normal

    # Hard
    scoreboard players set $TicketCount Arena.Temp 0

    execute store result score $TicketCount-DataDef Arena.Temp run clear @s paper{Arena:Ticket3} 32
    execute store result score $TicketCount-CMDDef Arena.Temp run clear @s paper{CustomModelData:320003} 32

    scoreboard players operation $TicketCount Arena.Temp += $TicketCount-DataDef Arena.Temp
    scoreboard players operation $TicketCount Arena.Temp += $TicketCount-CMDDef Arena.Temp

    execute store result storage arena:temp TicketExchange.Hard int 1 run scoreboard players get $TicketCount Arena.Temp

    execute at @p run loot spawn ~ ~ ~ loot arena:ticket/hard

# 通知
execute unless data storage arena:temp {TicketExchange:{Easy:0,Normal:0,Hard:0}} run tellraw @s [{"translate": "arena.game.message.prefix"},{"translate": "arena.other.message.ticket_exchange.success","with":[{"nbt":"TicketExchange.Easy","storage":"arena:temp","color": "white","bold": true},{"nbt":"TicketExchange.Normal","storage":"arena:temp","color": "white","bold": true},{"nbt":"TicketExchange.Hard","storage":"arena:temp","color": "white","bold": true}]}]
execute unless data storage arena:temp {TicketExchange:{Easy:0,Normal:0,Hard:0}} run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.5

execute if data storage arena:temp {TicketExchange:{Easy:0,Normal:0,Hard:0}} run tellraw @s [{"translate": "arena.game.message.prefix"},{"translate": "arena.other.message.ticket_exchange.failed"}]
execute if data storage arena:temp {TicketExchange:{Easy:0,Normal:0,Hard:0}} run playsound entity.enderman.teleport master @s ~ ~ ~ 1 0.5

