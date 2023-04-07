# load
# スコアボード定義
scoreboard objectives add ArenaBoss dummy
scoreboard objectives add ArenaBoss.Temp dummy
scoreboard objectives add ArenaBoss.DamageDealt dummy

# team
team add NoCollision
team modify NoCollision collisionRule never

# 各種データの設定
data modify storage arena:core Boss.StageInfo set value []

data modify storage arena:core Boss.StageInfo append value {Name:'[{"text":"【","color":"red","bold":true},{"text":"キングブレイズ","color":"gold","bold":true},{"text":"】","color":"red","bold":true}]',TicketRequired:3,MaxPlayerCount:5,StageID:1,MetaData:{Name:"Fire"}}
data modify storage arena:core Boss.StageInfo append value {Name:'[{"text":"【","color":"blue","bold":true},{"text":"ガーディアン","color":"aqua","bold":true},{"text":"】","color":"blue","bold":true}]',TicketRequired:4,MaxPlayerCount:6,StageID:2,MetaData:{Name:"Water"}}
data modify storage arena:core Boss.StageInfo append value {Name:'[{"text":"【","color":"gold","bold":true},{"text":"レゾナンスエンダーマン","color":"yellow","bold":true},{"text":"】","color":"gold","bold":true}]',TicketRequired:4,MaxPlayerCount:6,StageID:3,MetaData:{Name:"Thunder"}}

