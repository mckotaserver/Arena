## プレイヤー別のクエスト進行データ
# idを設定
$data modify storage arena_quests:temp quest_data_append.data.$(type) append value {id:"",objective:0,current_value:0,is_completed:false}

# 目標値を設定
$data modify storage arena_quests:temp quest_data_append.data.$(type)[-1].objective set from storage arena_quests:temp quest_data_append.original[0].requirement.count

# id
execute store result score #quest_data_append.index arena.temp run data get storage arena_quests:temp quest_data_append.macro.index
execute store result storage arena_quests:temp quest_data_append.macro.index int 1 run scoreboard players add #quest_data_append.index arena.temp 1

$data modify storage arena_quests:temp quest_data_append.data.$(type)[-1].id set from storage arena_quests:temp quest_data_append.original[0].id 

# 再起
data remove storage arena_quests:temp quest_data_append.original[0]
execute if data storage arena_quests:temp quest_data_append.original[0] run function arena_utility:quests/data_append with storage arena_quests:temp quest_data_append.macro

