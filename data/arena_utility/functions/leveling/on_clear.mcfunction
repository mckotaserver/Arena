## ステージクリア時処理
# 一時タグ除去
tag @s remove arena.temp.level_process

# 現在の値を取得
function #kota_library:player_database {name:"@s",path:"arena.leveling",value:"",operation:"get"}

# 経験値量を加算
execute store result score #misc.arena_level.exp_value arena.temp run data get storage kota_library: player_database.out.experience.current
scoreboard players operation #misc.arena_level.exp_value arena.temp += #misc.arena_level.exp_gain arena.temp

data modify storage kota_library: player_database.in set value {name:"@s",path:"arena.leveling.experience.current",value:0,operation:"modify.set"}

# 必要量を達成しているか判定
execute store result score #misc.arena_level.exp_required arena.temp run data get storage kota_library: player_database.out.experience.required

    # 達せず → 値をデータに返す, 処理中断
    execute unless score #misc.arena_level.exp_value arena.temp >= #misc.arena_level.exp_required arena.temp store result storage kota_library: player_database.in.value int 1 run scoreboard players get #misc.arena_level.exp_value arena.temp
    execute unless score #misc.arena_level.exp_value arena.temp >= #misc.arena_level.exp_required arena.temp run function #kota_library:player_database with storage kota_library: player_database.in
    
    execute unless score #misc.arena_level.exp_value arena.temp >= #misc.arena_level.exp_required arena.temp run return 0

    # 達した → レベルアップ処理へ
    scoreboard players operation #misc.arena_level.exp_remained arena.temp = #misc.arena_level.exp_value arena.temp
    scoreboard players operation #misc.arena_level.exp_remained arena.temp -= #misc.arena_level.exp_required arena.temp

# データベース更新
    # 必要経験値量を再設定
    execute store result score #misc.arena_level.exp_required_multiplier arena.temp run data get storage arena:assets config.arena_leveling.requirement_multiplier 100 
    scoreboard players operation #misc.arena_level.exp_required arena.temp *= #misc.arena_level.exp_required_multiplier arena.temp
    scoreboard players operation #misc.arena_level.exp_required arena.temp /= #100 Constant

    data modify storage kota_library: player_database.in set value {name:"@s",path:"arena.leveling.experience.required",value:0,operation:"modify.set"}
    execute store result storage kota_library: player_database.in.value int 1 run scoreboard players get #misc.arena_level.exp_required arena.temp

    function #kota_library:player_database with storage kota_library: player_database.in

    # 現在のレベル + 1
    execute store result score #misc.arena_level.level arena.temp run data get storage kota_library: player_database.out.level
    scoreboard players add #misc.arena_level.level arena.temp 1

    data modify storage kota_library: player_database.in set value {name:"@s",path:"arena.leveling.level",value:0,operation:"modify.set"}
    execute store result storage kota_library: player_database.in.value int 1 run scoreboard players get #misc.arena_level.level arena.temp

    function #kota_library:player_database with storage kota_library: player_database.in

        # レベル 5以上 → エンドレス許可
        execute if score #misc.arena_level.level arena.temp matches 5.. run function arena_normal:misc/advancements_grant {path:"flags/allow_endless"}
        execute if score #misc.arena_level.level arena.temp matches 10.. run function arena_normal:misc/advancements_grant {path:"flags/allow_dungeons"}

    # 現在の経験値量 = 超過分
    data modify storage kota_library: player_database.in set value {name:"@s",path:"arena.leveling.experience.current",value:0,operation:"modify.set"}
    execute store result storage kota_library: player_database.in.value int 1 run scoreboard players get #misc.arena_level.exp_remained arena.temp

    function #kota_library:player_database with storage kota_library: player_database.in

# 通知
    # playsound
    execute at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 2
    execute at @s run playsound block.note_block.bit master @s ~ ~ ~ 1 2

    execute at @s as @a[tag=arena.flags.display_others_announcement,distance=0.1..] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 2

    # tellraw
    function kota_library:misc/get_player_name

    scoreboard players operation #misc.arena_level.level_before arena.temp = #misc.arena_level.level arena.temp
    scoreboard players remove #misc.arena_level.level_before arena.temp 1

    tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.leveling.message.levelup_player","with":[{"score":{"name": "#misc.arena_level.level_before","objective": "arena.temp"},"color": "yellow","bold": true},{"score":{"name": "#misc.arena_level.level","objective": "arena.temp"},"color": "yellow","bold": true}]}]
    execute at @s run tellraw @a[tag=arena.flags.display_others_announcement,distance=0.1..] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.leveling.message.levelup_server","with":[{"storage":"kota_library:","nbt":"get_player_name.out"},{"score":{"name": "#misc.arena_level.level_before","objective": "arena.temp"},"color": "yellow","bold": true},{"score":{"name": "#misc.arena_level.level","objective": "arena.temp"},"color": "yellow","bold": true}]}]
