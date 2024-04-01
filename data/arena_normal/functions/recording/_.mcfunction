## 記録関連処理: 終了時
#> 時間データの整形
    # リセット
    data modify storage arena_normal:temp recording set value {}

    # 現在時刻と開始時刻を取得
    execute store result score #current_tick arena.temp run time query gametime
    execute store result score #recording.start_tick arena.temp run data get entity @s data.arena.recording.start_tick

    # 差分の計算, 最大値 (719999t = 9:59:59.95) を超える場合は上限設定
    scoreboard players operation #current_tick arena.temp -= #recording.start_tick arena.temp
    execute if score #current_tick arena.temp matches 720000.. run scoreboard players set #current_tick arena.temp 719999

    execute store result storage arena_normal:temp recording.time.tick int 1 run scoreboard players get #current_tick arena.temp

    # 時 / 分 / 秒 / 小数点以下 に変換, 表示データの作成
    function arena_normal:recording/time_conversion/_

#> データベースへの登録
    # player_head召喚の準備
    setblock ~ -64 ~ bedrock replace
    setblock ~ -64 ~ barrel replace

    # 処理
    execute if data entity @s {data:{arena:{stage_data:{difficulty:2,player_count:1}}}} as @r[tag=arena.normal_stage.player,distance=..48] run function arena_normal:recording/register with entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.stage_detail
    tag @a[tag=arena.temp.record_registered] remove arena.temp.record_registered

    # 後始末
    setblock ~ -64 ~ bedrock replace
