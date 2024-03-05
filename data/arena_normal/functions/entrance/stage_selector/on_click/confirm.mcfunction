## 〚入場〛ボタン押下
# トリガー解除
advancement revoke @s only arena_normal:stage_selector/on_click/confirm/left
advancement revoke @s only arena_normal:stage_selector/on_click/confirm/right

# playsound
playsound ui.button.click master @s ~ ~ ~ 1 2

#> 入場可否
# 必要データの取得
data modify storage kota_library: array_picker.in set from storage arena:assets stage_data
data modify storage kota_library: array_picker.index set from entity @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] data.Arena.SelectorPage.mob_type

function kota_library:storage_modifier/array_picker with storage kota_library: array_picker 

# エンドレスの場合 → 適当な値に設定
execute if data entity @e[tag=Arena.Normal-Stage.Lobby,sort=nearest,limit=1] {data:{Arena:{lobby_type:"endless"}}} run function arena_normal:endless/entrance_setting

    #> AP の不足
        # 必要APを取得
        execute store result score #Entrance.APRequired Arena.Temp run data get storage kota_library: array_picker.out.required_ap

        # プレイヤーが値を持っていなければ0に設定
        execute as @a[distance=..4] unless score @s arena = @s arena run scoreboard players set @s arena 0

        # 比較
        data modify storage arena_normal:temp StageJoinable set value true
        execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] if score #Entrance.APRequired Arena.Temp > @s arena run data modify storage arena_normal:temp StageJoinable set value false

        # 入場判定 → 不可なら警告して処理中止
        execute if data storage arena_normal:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.not_enough_arena_point"}]
        execute if data storage arena_normal:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

        execute if data storage arena_normal:temp {StageJoinable:false} run return 0

    #> 空きステージの有無
        # 空きステージにタグ付与
        execute as @e[tag=Arena.Normal-Stage.Stage-Core] at @s unless entity @a[tag=Arena.Normal-Stage.Player,distance=..48] run tag @s add Arena.Temp-EmptyStage

        data modify storage arena_normal:temp StageJoinable set value true
        execute unless entity @e[tag=Arena.Temp-EmptyStage] run data modify storage arena_normal:temp StageJoinable set value false

        tag @e[tag=Arena.Temp-EmptyStage] remove Arena.Temp-EmptyStage

        # 入場判定 → 不可なら警告して処理中止
        execute if data storage arena_normal:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.no_available_stage"}]
        execute if data storage arena_normal:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

        execute if data storage arena_normal:temp {StageJoinable:false} run return 0

    #> 人数判定
        # エリア内の人数, 規定人数を取得
        execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] store result score #Entrance.player_count Arena.Temp if entity @a[distance=..4]
        execute store result score #Entrance.player_count-Max Arena.Temp run data get storage kota_library: array_picker.out.max_player

        data modify storage arena_normal:temp StageJoinable set value true
        execute if score #Entrance.player_count Arena.Temp > #Entrance.player_count-Max Arena.Temp run data modify storage arena_normal:temp StageJoinable set value false

        # 規定人数を超えている場合 → 警告して処理中止
        execute if data storage arena_normal:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.too_many_players","with":[{"nbt":"stage_data_searching.out.max_player","storage":"arena_normal:temp","color": "yellow","bold": true}]}]
        execute if data storage arena_normal:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

        execute if data storage arena_normal:temp {StageJoinable:false} run return 0

# 入場判定 → 可なら減算
execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] run scoreboard players operation @s arena -= #Entrance.APRequired Arena.Temp

#> 入場処理など
# 前準備
    # 範囲内のプレイヤーをタグ付け
    execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tag @a[distance=..4] add Arena.Normal-Stage.Player

# 入場先ステージの準備
    # 入場可能ステージを選定・・ の前に使われてないステージがあったらリセット
    execute as @e[tag=Arena.Normal-Stage.Stage-Core] if data entity @s {data:{Arena:{isEmpty:false}}} at @s unless entity @a[tag=Arena.Normal-Stage.Player,distance=..48] run function arena_normal:misc/stage_reset

    # 入場可能ステージを選定
    execute as @e[tag=Arena.Normal-Stage.Stage-Core] if data entity @s {data:{Arena:{isEmpty:true}}} run tag @s add Arena.temp.EmptyStage
    tag @e[tag=Arena.temp.EmptyStage,sort=nearest,limit=1] add Arena.temp.stage_selected

    tag @e[tag=Arena.temp.EmptyStage] remove Arena.temp.EmptyStage

    # マーカー内データの設定

        # データ設定用ストレージ
        data modify storage arena_normal:temp Entrance.data set value {}

        # isEmpty → false
        data modify storage arena_normal:temp Entrance.data.isEmpty set value false

        # 選択したステージの種類・難易度データをコピー
        data modify storage arena_normal:temp Entrance.data.stage_data set from entity @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] data.Arena.SelectorPage

        # ステージ種類データ
        data modify storage arena_normal:temp Entrance.data.stage_data.type set from entity @e[tag=Arena.Normal-Stage.Lobby,sort=nearest,limit=1] data.Arena.lobby_type

            # エンドレス → 難易度を固定
            execute if data storage arena_normal:temp {Entrance:{data:{stage_data:{type:"endless"}}}} run data modify storage arena_normal:temp Entrance.data.stage_data.Difficulty set value 2

        # ステージの詳細情報をデータベースからコピー
        function arena_normal:misc/data_search with storage arena_normal:temp Entrance.data.stage_data
        data modify storage arena_normal:temp Entrance.data.stage_detail set from storage kota_library: array_picker.out

        # プレイヤー数の取得 >> 上記プレイヤー数判定で取得 を流用
        execute store result storage arena_normal:temp Entrance.data.stage_data.player_count int 1 run scoreboard players get #Entrance.player_count Arena.Temp

    # ストラクチャーのロード
    execute at @e[tag=Arena.temp.stage_selected,limit=1] run place template arena_normal:stage/normal ~-34 ~-4 ~-34

# 帰還用 → 入場ロビーのデータ取得
data modify storage arena_normal:temp Entrance.data.announcement_display.entered_lobby set from entity @e[tag=Arena.Normal-Stage.Lobby,sort=nearest,limit=1] Tags[0]

# 開始タイマー関連処理
tag @r[distance=..4] add Arena.Normal-Stage.Core-Player

scoreboard players set @p[tag=Arena.Normal-Stage.Core-Player] Arena.Timer 20
data modify storage arena_normal:temp Entrance.data.status set value "wave_waiting"
data modify storage arena_normal:temp Entrance.data.misc.countdown set value 15

# クリア記録関係
execute store result storage arena_normal:temp Entrance.data.Recording.StartTick int 1 run time query gametime

# ストレージからマーカーにデータコピー
data modify entity @e[tag=Arena.temp.stage_selected,limit=1] data.Arena set from storage arena_normal:temp Entrance.data

# プレイヤー関連
    # プレイヤーIdを設定
    execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] run scoreboard players set @s Arena.PlayerID -1
    scoreboard players set #PlayerID Arena.Temp 0

    execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @r[distance=..4,limit=1] run function arena_normal:misc/set_player_id

    # LeaveGameスコアをリセット
    execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run scoreboard players reset @a[distance=..4] Arena.LeaveGame

    # tellraw
    execute unless data entity @e[tag=Arena.Normal-Stage.Lobby,sort=nearest,limit=1] {data:{Arena:{lobby_type:"endless"}}} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.welcome"}]
    execute if data entity @e[tag=Arena.Normal-Stage.Lobby,sort=nearest,limit=1] {data:{Arena:{lobby_type:"endless"}}} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.welcome_endless"}]
    
    execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_first"}]
    
    # TP
    execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @e[tag=Arena.temp.stage_selected] run tp @s ~ ~-0.25 ~ ~ ~

#> 後処理
# 一時タグを処理
tag @e[tag=Arena.temp.stage_selected] remove Arena.temp.stage_selected

