## チケット両替
# 
data modify storage arena:assets utility.menu.ticket_exchange append value {from:{},to:{},id:"ticket_exchange:hard_to_normal"}

data modify storage arena:assets utility.menu.ticket_exchange[-1].from set value {ticket:"hard",count:1}
data modify storage arena:assets utility.menu.ticket_exchange[-1].to set value {ticket:"normal",count:4}

