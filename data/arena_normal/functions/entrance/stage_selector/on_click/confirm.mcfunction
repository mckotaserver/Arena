## 〚入場〛ボタン押下
# トリガー解除
advancement revoke @s only arena_normal:stage_selector/on_click/confirm/left
advancement revoke @s only arena_normal:stage_selector/on_click/confirm/right

# playsound
playsound ui.button.click master @s ~ ~ ~ 1 2

#> 入場可否
# 必要データの取得
function arena_normal:misc/data_search with entity @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] data.Arena.SelectorPage

# エンドレスの場合 → 適当な値に設定
execute if data entity @e[tag=Arena.Normal-Stage.Lobby,sort=nearest,limit=1] {data:{Arena:{LobbyType:"Endless"}}} run function arena_normal:endless/entrance_setting

    #> AP の不足
    # 必要APを取得
    execute store result score #Entrance.APRequired Arena.Temp run data get storage arena:temp MatchingStageData.required_ap

    # 比較
    data modify storage arena:temp StageJoinable set value true
    execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] if score #Entrance.APRequired Arena.Temp > @s arena run data modify storage arena:temp StageJoinable set value false

    # 入場判定 → 不可なら警告して処理中止
    execute if data storage arena:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.not_enough_arena_point"}]
    execute if data storage arena:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena:temp {StageJoinable:false} run return -1

    #> 空きステージの有無
    # 空きステージにタグ付与
    execute as @e[tag=Arena.Normal-Stage.Stage-Core] at @s unless entity @a[tag=Arena.Normal-Stage.Player,distance=..48] run tag @s add Arena.Temp-EmptyStage

    data modify storage arena:temp StageJoinable set value true
    execute unless entity @e[tag=Arena.Temp-EmptyStage] run data modify storage arena:temp StageJoinable set value false

    tag @e[tag=Arena.Temp-EmptyStage] remove Arena.Temp-EmptyStage

    # 入場判定 → 不可なら警告して処理中止
    execute if data storage arena:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.no_available_stage"}]
    execute if data storage arena:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena:temp {StageJoinable:false} run return -1

    #> 人数判定
    # エリア内の人数, 規定人数を取得
    execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] store result score #Entrance.PlayerCount Arena.Temp if entity @a[distance=..4]
    execute store result score #Entrance.PlayerCount-Max Arena.Temp run data get storage arena:temp MatchingStageData.max_player

    data modify storage arena:temp StageJoinable set value true
    execute if score #Entrance.PlayerCount Arena.Temp > #Entrance.PlayerCount-Max Arena.Temp run data modify storage arena:temp StageJoinable set value false

    # 規定人数を超えている場合 → 警告して処理中止
    execute if data storage arena:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.too_many_players","with":[{"nbt":"MatchingStageData.data.max_player","storage":"arena:temp","color": "yellow","bold": true}]}]
    execute if data storage arena:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena:temp {StageJoinable:false} run return -1

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
    execute as @e[tag=Arena.Normal-Stage.Stage-Core] if data entity @s {data:{Arena:{isEmpty:true}}} run tag @s add Arena.Temp.EmptyStage
    tag @e[tag=Arena.Temp.EmptyStage,sort=nearest,limit=1] add Arena.Temp.StageSelected

    tag @e[tag=Arena.Temp.EmptyStage] remove Arena.Temp.EmptyStage

    # データ設定用ストレージ
    data modify storage arena:temp Entrance.data set value {}

    # isEmpty → false
    data modify storage arena:temp Entrance.data.isEmpty set value false

    # 選択したステージの種類・難易度データをコピー
    data modify storage arena:temp Entrance.data.StageData set from entity @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] data.Arena.SelectorPage

    # ステージ種類データ
    data modify storage arena:temp Entrance.data.StageData.Type set from entity @e[tag=Arena.Normal-Stage.Lobby,sort=nearest,limit=1] data.Arena.LobbyType
    
        # エンドレス → 難易度を固定
        execute if data storage arena:temp {Entrance:{data:{Type:"Endless"}}} run data modify storage arena:temp Entrance.data.StageData.Difficulty set value 2

    # ストラクチャーのロード
    execute at @e[tag=Arena.Temp.StageSelected,limit=1] run place template arena_normal:stage/normal ~-34 ~-4 ~-34

    # プレイヤー数の取得 >> 上記プレイヤー数判定で取得 を流用
    execute store result storage arena:temp Entrance.data.PlayerCount int 1 run scoreboard players get #Entrance.PlayerCount Arena.Temp

# 帰還用 → 入場ロビーのデータ取得
data modify storage arena:temp Entrance.data.EnteredLobby set from entity @e[tag=Arena.Normal-Stage.Lobby,sort=nearest,limit=1] Tags[0]

# 開始タイマー関連処理
    # 現在時刻を取得, カウント終了時刻を計算
    execute store result score #EndTick Arena.Temp run time query gametime
    scoreboard players add #EndTick Arena.Temp 300

    # 入場先マーカーのデータにコピー
    execute store result storage arena:temp Entrance.data.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp

    # カウント開始
    data modify storage arena:temp Entrance.data.Timer.WaveWaiting set value true
    schedule function arena_normal:misc/wave_timer 1s

# ストレージからマーカーにデータコピー
data modify entity @e[tag=Arena.Temp.StageSelected,limit=1] data.Arena set from storage arena:temp Entrance.data

# プレイヤー関連
    # tellraw
    execute unless data entity @e[tag=Arena.Normal-Stage.Lobby,sort=nearest,limit=1] {data:{Arena:{LobbyType:"Endless"}}} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.welcome"}]
    execute if data entity @e[tag=Arena.Normal-Stage.Lobby,sort=nearest,limit=1] {data:{Arena:{LobbyType:"Endless"}}} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.welcome_endless"}]
    
    execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_first"}]
    
    # TP
    execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @e[tag=Arena.Temp.StageSelected] run tp @s ~ ~-0.25 ~ ~ ~

#> 後処理
# 一時タグを処理
tag @e[tag=Arena.Temp.StageSelected] remove Arena.Temp.StageSelected

