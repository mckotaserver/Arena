## チケット両替
# 
data modify storage arena:assets utility.menu.ticket_exchange append value {from:{},to:{},id:"ticket_exchange:normal_to_easy"}

data modify storage arena:assets utility.menu.ticket_exchange[-1].from set value {ticket:"normal",count:1}
data modify storage arena:assets utility.menu.ticket_exchange[-1].to set value {ticket:"easy",count:2}

