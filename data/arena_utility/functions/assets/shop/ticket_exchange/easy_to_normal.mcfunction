## チケット両替
# 
data modify storage arena:assets utility.menu.ticket_exchange append value {from:{},to:{},id:"ticket_exchange:easy_to_normal"}

data modify storage arena:assets utility.menu.ticket_exchange[-1].from set value {ticket:"easy",count:6}
data modify storage arena:assets utility.menu.ticket_exchange[-1].to set value {ticket:"normal",count:1}

