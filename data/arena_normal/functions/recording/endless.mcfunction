## データベースへの登録
# 一時ストレージに格納
data modify storage arena_normal:temp recording.Compound set value {}

#> 各データをまとめ
# 実記録 (Wave)
data modify storage arena_normal:temp recording.Compound.record set from storage arena_normal:temp recording.Actualrecord

# 表示データ作成
$data modify storage arena_normal:temp recording.Compound.display_data set value "Wave $(Actualrecord)" 

# UUID
data modify storage arena_normal:temp recording.Compound.UUID set from entity @s UUID

# プレイヤー名の取得
loot replace block ~ -64 ~ container.0 loot arena_normal:misc/player_head
data modify storage arena_normal:temp recording.Compound.Name set from block ~ -64 ~ Items[{Slot:0b}].tag.SkullOwner.Name

# タイムスタンプ
execute store result storage arena_normal:temp recording.Compound.TimeStamp int 1 run time query gametime

# データベースに挿入
    # 実行回数カウント = 0
    data modify storage arena_normal:temp recording.Insertion.counter set value 0
    execute store result score #recording.counter arena.temp run data get storage arena_normal:temp recording.Insertion.counter

    # データセット
    data modify storage arena_normal:temp recording.Insertion.Categoried set from storage arena:records normal[{name:"エンドレス"}].data
    data modify storage arena_normal:temp recording.Insertion.name set value "エンドレス"

    data modify storage arena_normal:temp recording.Insertion.UUID set from storage arena_normal:temp recording.Compound.UUID

    # 重複データの有無を確認
    function arena_normal:recording/insertion/dupe_check with storage arena_normal:temp recording.Insertion

    # 挿入
    execute if data storage arena_normal:temp {recording:{Insertion:{Execute:true}}} run function arena_normal:recording/insertion/_ with storage arena_normal:temp recording.Insertion

#> 再起
# 
# tag @s add arena.temp-recordRegistered
# execute as @r[tag=arena.normal_stage.player,tag=!arena.temp-recordRegistered,distance=..48] run function arena_normal:recording/register with entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.stage_data

