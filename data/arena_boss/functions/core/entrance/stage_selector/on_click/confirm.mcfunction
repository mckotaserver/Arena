## 〚入場〛ボタン押下
# トリガー解除
advancement revoke @s only arena_boss:stage_selector/on_click/confirm/left
advancement revoke @s only arena_boss:stage_selector/on_click/confirm/right

# playsound
playsound ui.button.click master @s ~ ~ ~ 1 2

#> 入場可否
# 必要データの取得
function arena_boss:misc/data_set with entity @e[tag=arena.boss.Selector.Core,sort=nearest,limit=1] data.arena.SelectorPage

# 入場先マーカーにタグ付け
function arena_boss:core/entrance/core_selection with storage arena_boss:temp bossData

    #> AP の不足
    # 必要APを取得
    execute store result score #entrance.APRequired arena.temp run data get storage arena_boss:temp bossData.required_ap

    # 比較
    data modify storage arena_boss:temp StageJoinable set value true
    execute at @e[tag=arena.boss.entrance,sort=nearest,limit=1] as @a[distance=..4] if score #entrance.APRequired arena.temp > @s arena run data modify storage arena_boss:temp StageJoinable set value false

    # 入場判定 → 不可なら警告して処理中止
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=arena.boss.entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.not_enough_arena_point"}]
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=arena.boss.entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_boss:temp {StageJoinable:false} run return 0

    #> 入場中プレイヤーがいる！ 
    data modify storage arena_boss:temp StageJoinable set value true
    execute at @e[tag=arena.temp-bossJoiningStage] if entity @a[tag=arena.boss.player,distance=..128] run data modify storage arena_boss:temp StageJoinable set value false

    # 入場判定 → 不可なら警告して処理中止
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=arena.boss.entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.someone_already_playing"}]
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=arena.boss.entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_boss:temp {StageJoinable:false} run return 0

    #> 人数判定
    # エリア内の人数, 規定人数を取得
    execute at @e[tag=arena.boss.entrance,sort=nearest,limit=1] store result score #entrance.player_count arena.temp if entity @a[distance=..4]
    execute store result score #entrance.player_count-Max arena.temp run data get storage arena_boss:temp bossData.max_player

    data modify storage arena_boss:temp StageJoinable set value true
    execute if score #entrance.player_count arena.temp > #entrance.player_count-Max arena.temp run data modify storage arena_boss:temp StageJoinable set value false

    # 規定人数を超えている場合 → 警告して処理中止
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=arena.boss.entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.too_many_players","with":[{"nbt":"bossData.max_player","storage":"arena_boss:temp","color": "yellow","underlined": true}]}]
    execute if data storage arena_boss:temp {StageJoinable:false} at @e[tag=arena.boss.entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_boss:temp {StageJoinable:false} run return 0

# 入場判定 → 可なら減算
execute at @e[tag=arena.boss.entrance,sort=nearest,limit=1] as @a[distance=..4] run scoreboard players operation @s arena -= #entrance.APRequired arena.temp

#> 入場処理など
# 前準備
    # 範囲内のプレイヤーをタグ付け
    execute at @e[tag=arena.boss.entrance,sort=nearest,limit=1] run tag @a[distance=..4] add arena.boss.player

# 入場先ステージの準備
    # データ設定用ストレージ
    data modify storage arena_boss:temp entrance.data set value {}
    
    # ステージ内容
    data modify storage arena_boss:temp entrance.data.boss.StageData set from storage arena_boss:temp bossData

    # ステージリセット
    function arena_boss:misc/stage_reset with storage arena_boss:temp bossData

    # isEmpty → false
    data modify storage arena_boss:temp entrance.data.isEmpty set value false

    # OperationData 空データ作成
    data modify storage arena_boss:temp entrance.data.boss.OperationData set value {}

    # プレイヤー数の取得 >> 上記プレイヤー数判定で取得 を流用
    execute store result storage arena_boss:temp entrance.data.StageData.player_count int 1 run scoreboard players get #entrance.player_count arena.temp

# 帰還用 → 入場ロビーのデータ取得
data modify storage arena_boss:temp entrance.data.announcement_display.entered_lobby set from entity @e[tag=arena.boss.lobby,sort=nearest,limit=1] Tags[0]

# CoreplayerSelection → ID設定
execute at @e[tag=arena.boss.entrance,sort=nearest,limit=1] as @a[distance=..4] run scoreboard players set @s arena.player_id -1
execute at @e[tag=arena.boss.entrance,sort=nearest,limit=1] as @a[distance=..4] store result score @s arena.player_id if entity @a[distance=..4,scores={arena.player_id=0..}]

# 開始タイマー関連処理
    # 現在時刻を取得, カウント終了時刻を計算
    execute store result score #EndTick arena.temp run time query gametime
    scoreboard players add #EndTick arena.temp 600

    # 入場先マーカーのデータにコピー
    execute store result storage arena_boss:temp entrance.data.Timer.EndTick int 1 run scoreboard players get #EndTick arena.temp

    # カウント開始
    data modify storage arena_boss:temp entrance.data.Timer.WaveWaiting set value true
    schedule function arena_boss:misc/timer/scheduler 1s

# クリア記録関係
execute store result storage arena_boss:temp entrance.data.Recording.StartTick int 1 run time query gametime

# ストレージからマーカーにデータコピー
data modify entity @e[tag=arena.temp-bossJoiningStage,limit=1] data.arena set from storage arena_boss:temp entrance.data

# プレイヤー関連
    # tellraw
    execute at @e[tag=arena.boss.entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.game.message.welcome"}]
    execute at @e[tag=arena.boss.entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.game.message.start_announcement"}]
    
    # TP
    execute at @e[tag=arena.boss.entrance,sort=nearest,limit=1] as @a[distance=..4] at @e[tag=arena.temp-bossJoiningStage] run tp @s ~ ~-0.25 ~ ~ ~
    execute at @e[tag=arena.temp-bossJoiningStage] as @a[distance=..4] run tp @s @s

    # playsound
    execute at @e[tag=arena.temp-bossJoiningStage] as @a[tag=arena.boss.player,distance=..32] run playsound entity.ender_dragon.growl master @s ~ ~ ~ 0.5 0.9

#> 後処理
# 一時タグを処理
tag @e[tag=arena.temp-bossJoiningStage] remove arena.temp-bossJoiningStage

