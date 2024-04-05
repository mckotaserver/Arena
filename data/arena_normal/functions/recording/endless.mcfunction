## データベースへの登録
# 一時ストレージに格納
data modify storage arena_normal:temp recording.compound set value {}

#> 各データをまとめ
# 実記録 (Wave)
data modify storage arena_normal:temp recording.compound.record set from storage arena_normal:temp recording.actual_record

# 表示データ作成
$data modify storage arena_normal:temp recording.compound.display_data set value "Wave $(actual_record)" 

# UUID
data modify storage arena_normal:temp recording.compound.UUID set from entity @s UUID

# プレイヤー名の取得
function kota_library:misc/get_player_name
data modify storage arena_normal:temp recording.compound.Name set from storage kota_library: get_player_name.out

# タイムスタンプ
execute store result storage arena_normal:temp recording.compound.time_stamp int 1 run time query gametime

# データベースに挿入
    # 実行回数カウント = 0
    data modify storage arena_normal:temp recording.insertion.counter set value 0
    execute store result score #recording.counter arena.temp run data get storage arena_normal:temp recording.insertion.counter

    # データセット
    data modify storage arena_normal:temp recording.insertion.categoried set from storage arena:records normal[{name:"エンドレス"}].data
    data modify storage arena_normal:temp recording.insertion.name set value "エンドレス"

    data modify storage arena_normal:temp recording.insertion.UUID set from storage arena_normal:temp recording.compound.UUID

    # 重複データの有無を確認
    function arena_normal:recording/insertion/dupe_check with storage arena_normal:temp recording.insertion

    # 挿入
    execute if data storage arena_normal:temp {recording:{insertion:{execute:true}}} run function arena_normal:recording/insertion/_ with storage arena_normal:temp recording.insertion

#> 再起
# 
# tag @s add arena.temp.recordRegistered
# execute as @r[tag=arena.normal_stage.player,tag=!arena.temp.recordRegistered,distance=..32] run function arena_normal:recording/register with entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.stage_data

