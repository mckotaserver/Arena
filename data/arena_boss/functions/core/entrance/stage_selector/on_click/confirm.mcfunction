## 〚入場〛ボタン押下
# トリガー解除
advancement revoke @s only arena_boss:stage_selector/on_click/confirm/left
advancement revoke @s only arena_boss:stage_selector/on_click/confirm/right

# playsound
playsound ui.button.click master @s ~ ~ ~ 1 2

#> 入場可否
# 必要データの取得
function arena_boss:misc/data_set with entity @e[tag=Arena.Boss.Selector.Core,sort=nearest,limit=1] data.Arena.SelectorPage

# 入場先マーカーにタグ付け
function arena_boss:core/entrance/core_selection with storage arena_boss:temp BossData

    #> AP の不足
    # 必要APを取得
    execute store result score #Entrance.APRequired Arena.Temp run data get storage arena_boss:temp BossData.required_ap

    # 比較
    data modify storage arena_boss:temp StageJoinable set value true
    execute at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] as @a[distance=..4] if score #Entrance.APRequired Arena.Temp > @s arena run data modify storage arena_boss:temp StageJoinable set value false

    # 入場判定 → 不可なら警告して処理中止
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.not_enough_arena_point"}]
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_boss:temp {StageJoinable:false} run return 0

    #> 入場中プレイヤーがいる！ 
    data modify storage arena_boss:temp StageJoinable set value true
    execute at @e[tag=Arena.Temp-BossJoiningStage] if entity @a[tag=Arena.Boss.Player,distance=..128] run data modify storage arena_boss:temp StageJoinable set value false

    # 入場判定 → 不可なら警告して処理中止
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.someone_already_playing"}]
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_boss:temp {StageJoinable:false} run return 0

    #> 人数判定
    # エリア内の人数, 規定人数を取得
    execute at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] store result score #Entrance.PlayerCount Arena.Temp if entity @a[distance=..4]
    execute store result score #Entrance.PlayerCount-Max Arena.Temp run data get storage arena_boss:temp BossData.max_player

    data modify storage arena_boss:temp StageJoinable set value true
    execute if score #Entrance.PlayerCount Arena.Temp > #Entrance.PlayerCount-Max Arena.Temp run data modify storage arena_boss:temp StageJoinable set value false

    # 規定人数を超えている場合 → 警告して処理中止
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.too_many_players","with":[{"nbt":"BossData.max_player","storage":"arena_boss:temp","color": "yellow","underlined": true}]}]
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_boss:temp {StageJoinable:false} run return 0

# 入場判定 → 可なら減算
execute at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] as @a[distance=..4] run scoreboard players operation @s arena -= #Entrance.APRequired Arena.Temp

#> 入場処理など
# 前準備
    # 範囲内のプレイヤーをタグ付け
    execute at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] run tag @a[distance=..4] add Arena.Boss.Player

# 入場先ステージの準備
    # データ設定用ストレージ
    data modify storage arena_boss:temp Entrance.data set value {}
    
    # ステージ内容
    data modify storage arena_boss:temp Entrance.data.Boss.StageData set from storage arena_boss:temp BossData

    # ステージリセット
    function arena_boss:misc/stage_reset with storage arena_boss:temp BossData

    # isEmpty → false
    data modify storage arena_boss:temp Entrance.data.isEmpty set value false

    # OperationData 空データ作成
    data modify storage arena_boss:temp Entrance.data.Boss.OperationData set value {}

    # プレイヤー数の取得 >> 上記プレイヤー数判定で取得 を流用
    execute store result storage arena_boss:temp Entrance.data.StageData.PlayerCount int 1 run scoreboard players get #Entrance.PlayerCount Arena.Temp

# 帰還用 → 入場ロビーのデータ取得
data modify storage arena_boss:temp Entrance.data.announcement_display.entered_lobby set from entity @e[tag=Arena.Boss.Lobby,sort=nearest,limit=1] Tags[0]

# CorePlayerSelection → ID設定
execute at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] as @a[distance=..4] run scoreboard players set @s Arena.PlayerID -1
execute at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] as @a[distance=..4] store result score @s Arena.PlayerID if entity @a[distance=..4,scores={Arena.PlayerID=0..}]

# 開始タイマー関連処理
    # 現在時刻を取得, カウント終了時刻を計算
    execute store result score #EndTick Arena.Temp run time query gametime
    scoreboard players add #EndTick Arena.Temp 600

    # 入場先マーカーのデータにコピー
    execute store result storage arena_boss:temp Entrance.data.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp

    # カウント開始
    data modify storage arena_boss:temp Entrance.data.Timer.WaveWaiting set value true
    schedule function arena_boss:misc/timer/scheduler 1s

# クリア記録関係
execute store result storage arena_boss:temp Entrance.data.Recording.StartTick int 1 run time query gametime

# ストレージからマーカーにデータコピー
data modify entity @e[tag=Arena.Temp-BossJoiningStage,limit=1] data.Arena set from storage arena_boss:temp Entrance.data

# プレイヤー関連
    # tellraw
    execute at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.game.message.welcome"}]
    execute at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.game.message.start_announcement"}]
    
    # TP
    execute at @e[tag=Arena.Boss.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @e[tag=Arena.Temp-BossJoiningStage] run tp @s ~ ~-0.25 ~ ~ ~
    execute at @e[tag=Arena.Temp-BossJoiningStage] as @a[distance=..4] run tp @s @s

    # playsound
    execute at @e[tag=Arena.Temp-BossJoiningStage] as @a[tag=Arena.Boss.Player,distance=..32] run playsound entity.ender_dragon.growl master @s ~ ~ ~ 0.5 0.9

#> 後処理
# 一時タグを処理
tag @e[tag=Arena.Temp-BossJoiningStage] remove Arena.Temp-BossJoiningStage

