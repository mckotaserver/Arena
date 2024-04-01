## 〚入場〛ボタン押下
# トリガー解除
advancement revoke @s only arena_normal:stage_selector/on_click/confirm/left
advancement revoke @s only arena_normal:stage_selector/on_click/confirm/right

# playsound
playsound ui.button.click master @s ~ ~ ~ 1 2

#> 入場可否
# 必要データの取得
data modify storage kota_library: array_picker.in set from storage arena:assets stage_data
data modify storage kota_library: array_picker.index set from entity @e[tag=arena.normal_stage.selector_core,sort=nearest,limit=1] data.arena.selector_page.mob_type

function kota_library:storage_modifier/array_picker with storage kota_library: array_picker 

# エンドレスの場合 → 適当な値に設定
execute if data entity @e[tag=arena.normal_stage.lobby,sort=nearest,limit=1] {data:{arena:{lobby_type:"endless"}}} run function arena_normal:endless/entrance_setting

    #> AP の不足
        # 必要APを取得
        execute store result score #entrance.APRequired arena.temp run data get storage kota_library: array_picker.out.required_ap

        # プレイヤーが値を持っていなければ0に設定
        execute as @a[distance=..4] unless score @s arena = @s arena run scoreboard players set @s arena 0

        # 比較
        data modify storage arena_normal:temp entrance.available set value true
        execute at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] as @a[distance=..4] if score #entrance.APRequired arena.temp > @s arena run data modify storage arena_normal:temp entrance.available set value false

        # 入場判定 → 不可なら警告して処理中止
        execute if data storage arena_normal:temp {entrance:{available:false}} at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.not_enough_arena_point"}]
        execute if data storage arena_normal:temp {entrance:{available:false}} at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

        execute if data storage arena_normal:temp {entrance:{available:false}} run return 0

    #> 空きステージの有無
        # 空きステージにタグ付与
        execute as @e[tag=arena.normal_stage.stage_core] at @s unless entity @a[tag=arena.normal_stage.player,distance=..48] run tag @s add arena.temp.EmptyStage

        data modify storage arena_normal:temp entrance.available set value true
        execute unless entity @e[tag=arena.temp.EmptyStage] run data modify storage arena_normal:temp entrance.available set value false

        tag @e[tag=arena.temp.EmptyStage] remove arena.temp.EmptyStage

        # 入場判定 → 不可なら警告して処理中止
        execute if data storage arena_normal:temp {entrance:{available:false}} at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.no_available_stage"}]
        execute if data storage arena_normal:temp {entrance:{available:false}} at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

        execute if data storage arena_normal:temp {entrance:{available:false}} run return 0

    #> 人数判定
        # エリア内の人数, 規定人数を取得
        execute at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] store result score #entrance.player_count arena.temp if entity @a[distance=..4]
        execute store result score #entrance.player_count-Max arena.temp run data get storage kota_library: array_picker.out.max_player

        data modify storage arena_normal:temp entrance.available set value true
        execute if score #entrance.player_count arena.temp > #entrance.player_count-Max arena.temp run data modify storage arena_normal:temp entrance.available set value false

        # 規定人数を超えている場合 → 警告して処理中止
        execute if data storage arena_normal:temp {entrance:{available:false}} at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.too_many_players","with":[{"nbt":"stage_data_searching.out.max_player","storage":"arena_normal:temp","color": "yellow","bold": true}]}]
        execute if data storage arena_normal:temp {entrance:{available:false}} at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

        execute if data storage arena_normal:temp {entrance:{available:false}} run return 0

# 入場判定 → 可なら減算
execute at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] as @a[distance=..4] run scoreboard players operation @s arena -= #entrance.APRequired arena.temp

#> 入場処理など
# 前準備
    # 範囲内のプレイヤーをタグ付け
    execute at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] run tag @a[distance=..4] add arena.normal_stage.player

# 入場先ステージの準備
    # 入場可能ステージを選定・・ の前に使われてないステージがあったらリセット
    execute as @e[tag=arena.normal_stage.stage_core] if data entity @s {data:{arena:{isEmpty:false}}} at @s unless entity @a[tag=arena.normal_stage.player,distance=..48] run function arena_normal:misc/stage_reset

    # 入場可能ステージを選定
    execute as @e[tag=arena.normal_stage.stage_core] if data entity @s {data:{arena:{isEmpty:true}}} run tag @s add arena.temp.EmptyStage
    tag @e[tag=arena.temp.EmptyStage,sort=nearest,limit=1] add arena.temp.stage_selected

    tag @e[tag=arena.temp.EmptyStage] remove arena.temp.EmptyStage

    # マーカー内データの設定
        # データ設定用ストレージ
        data modify storage arena_normal:temp entrance.data set value {}

        # isEmpty → false
        data modify storage arena_normal:temp entrance.data.isEmpty set value false

        # 選択したステージの種類・難易度データをコピー
        data modify storage arena_normal:temp entrance.data.stage_data set from entity @e[tag=arena.normal_stage.selector_core,sort=nearest,limit=1] data.arena.selector_page

        # ステージ種類データ
        data modify storage arena_normal:temp entrance.data.stage_data.type set from entity @e[tag=arena.normal_stage.lobby,sort=nearest,limit=1] data.arena.lobby_type

            # エンドレス → 難易度を固定
            execute if data storage arena_normal:temp {entrance:{data:{stage_data:{type:"endless"}}}} run data modify storage arena_normal:temp entrance.data.stage_data.difficulty set value 2

        # ステージの詳細情報をデータベースからコピー
        function arena_normal:misc/data_search with storage arena_normal:temp entrance.data.stage_data
        data modify storage arena_normal:temp entrance.data.stage_detail set from storage kota_library: array_picker.out

        # プレイヤー数の取得 >> 上記プレイヤー数判定で取得 を流用
        execute store result storage arena_normal:temp entrance.data.stage_data.player_count int 1 run scoreboard players get #entrance.player_count arena.temp

        # 基礎倍率の計算; 毎度利用するのは同じ値であるので、共有部分は先に計算
            # 難易度から取得
            data modify storage kota_library: array_picker.index set from storage arena_normal:temp entrance.data.stage_data.difficulty
            data modify storage kota_library: array_picker.in set from storage arena:assets stage_difficulty

            function kota_library:storage_modifier/array_picker with storage kota_library: array_picker

            # 保存
            execute store result storage arena_normal:temp entrance.data.stage_data.multipliers.base float 1 run data get storage kota_library: array_picker.out.multiplier
            execute store result storage arena_normal:temp entrance.data.stage_data.multipliers.speed float 1 run data get storage kota_library: array_picker.out.speed_multiplier 100

                # tellraw awabi2048 {"text": "","color": "aqua","extra":[{"text":"[DEBUG]","color": "dark_purple"},{"text": " multiplier: "},{"nbt":"entrance.data.stage_data.multipliers.base","storage": "arena_normal:temp"}]}

            # エンドレスなら倍率を少し緩和
            execute if data storage arena_normal:temp {entrance:{data:{stage_data:{type:"endless"}}}} store result storage arena_normal:temp entrance.data.stage_data.multipliers.base float 0.85 run data get storage arena_normal:temp entrance.data.stage_data.multipliers.base
            execute if data storage arena_normal:temp {entrance:{data:{stage_data:{type:"endless"}}}} store result storage arena_normal:temp entrance.data.stage_data.multipliers.speed float 0.85 run data get storage arena_normal:temp entrance.data.stage_data.multipliers.speed

    # ストラクチャーのロード
    execute at @e[tag=arena.temp.stage_selected,limit=1] run place template arena_normal:stage/normal ~-34 ~-4 ~-34

# 帰還用 → 入場ロビーのデータ取得
data modify storage arena_normal:temp entrance.data.announcement_display.entered_lobby set from entity @e[tag=arena.normal_stage.lobby,sort=nearest,limit=1] Tags[0]

# 開始タイマー関連処理
    # コアプレイヤーを選定
    tag @r[distance=..4] add arena.normal_stage.core_player

    # 処理の予約
    scoreboard players set @p[tag=arena.normal_stage.core_player] arena.timer 40
    data modify storage arena_normal:temp entrance.data.scheduler.command set value "function arena_normal:wave_process/count_down"

    # フラグの有無でカウントを設定
    execute if entity @a[tag=arena.normal_stage.player,tag=!arena.flags.count_skip,distance=..48] run data modify storage arena_normal:temp entrance.data.misc.countdown set value 15
    execute unless entity @a[tag=arena.normal_stage.player,tag=!arena.flags.count_skip,distance=..48] run data modify storage arena_normal:temp entrance.data.misc.countdown set value 5

    # tellraw のための秒数取得
    data modify storage arena_normal:temp misc.tellraw.wave_break set from storage arena_normal:temp entrance.data.misc.countdown

# クリア記録関係
execute store result storage arena_normal:temp entrance.data.recording.start_tick int 1 run time query gametime

# ストレージからマーカーにデータコピー
data modify entity @e[tag=arena.temp.stage_selected,limit=1] data.arena set from storage arena_normal:temp entrance.data

# プレイヤー関連
    # プレイヤーIdを設定
    execute at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] as @a[distance=..4] run scoreboard players set @s arena.player_id -1
    scoreboard players set #player_id arena.temp 0

    execute at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] as @r[distance=..4,limit=1] run function arena_normal:misc/set_player_id

    # leave_gameスコアをリセット
    execute at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] run scoreboard players reset @a[distance=..4] arena.leave_game

    # tellraw
    execute unless data entity @e[tag=arena.normal_stage.lobby,sort=nearest,limit=1] {data:{arena:{lobby_type:"endless"}}} at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.welcome"}]
    execute if data entity @e[tag=arena.normal_stage.lobby,sort=nearest,limit=1] {data:{arena:{lobby_type:"endless"}}} at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.welcome_endless"}]
    
    execute at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_first","with":[{"nbt":"misc.tellraw.wave_break","storage":"arena_normal:temp","color": "yellow","underlined": true}]}]
    
    # TP
    execute at @e[tag=arena.normal_stage.entrance,sort=nearest,limit=1] as @a[distance=..4] at @e[tag=arena.temp.stage_selected] run tp @s ~ ~-0.2 ~ ~ ~

#> 後処理
# 一時タグを処理
tag @e[tag=arena.temp.stage_selected] remove arena.temp.stage_selected

