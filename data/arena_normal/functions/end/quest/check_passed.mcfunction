
    # 初期データの生成
        # daily
        function arena_utility:quests/player_data_update/_ {type:"daily"}

        data modify storage kota_library: player_database.in.value set from storage arena_quests:temp player_data_update.out 

        data modify storage kota_library: player_database.in.operation set value "modify.set"
        $data modify storage kota_library: player_database.in.name set value "$(player_name)"
        data modify storage kota_library: player_database.in.path set value "arena.quests.daily"

        function #kota_library:player_database with storage kota_library: player_database.in

        # weekly
        function arena_utility:quests/player_data_update/_ {type:"weekly"}

        data modify storage kota_library: player_database.in.value set from storage arena_quests:temp player_data_update.out 
        data modify storage kota_library: player_database.in.path set value "arena.quests.weekly"

        function #kota_library:player_database with storage kota_library: player_database.in
        
# 達成したか判定
function #kota_library:player_database {name:"$(player_name)",path:"arena.quests.$(type)",operation:"get",value:""}
data modify storage arena_quests:temp quest_testify.is_completed set from storage kota_library: player_database.out

# 1 加算
$execute if data storage arena_quests:temp {quest_testify:{is_completed:false}} run function kota_library:storage_modifier/data_calculation {storage:"kota_library:",path:"main[{name:'$(player_name)'}].arena.quests.$(type)[0].current_value",argument:1,operation:"+=",case:int} 

# 達成判定
$execute store result score #quest_progress.objective arena.temp run data get storage arena:quests player_data[{name:"$(player_name)"}].$(type)[{id:"$(id)"}].objective
$execute if score #quest_progress.current_value arena.temp = #quest_progress.objective arena.temp run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.quests.message.completed_single","with":[{"translate":"kota-server.arena.quests.$(id).name","hoverEvent":{"action": "show_text","contents": {"translate":"kota-server.arena.quests.$(id).description"}}}]}]
