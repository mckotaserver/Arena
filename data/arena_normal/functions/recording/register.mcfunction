## データベースへの登録
# 一時ストレージに格納
data modify storage arena_normal:temp Recording.Compound set value {}

#> 各データをまとめ
# 表示データ
data modify storage arena_normal:temp Recording.Compound.DisplayData set from storage arena_normal:temp Recording.Time.DisplayData

# 実記録 (tick)
data modify storage arena_normal:temp Recording.Compound.Record set from storage arena_normal:temp Recording.Time.Tick

# UUID
data modify storage arena_normal:temp Recording.Compound.UUID set from entity @s UUID

# プレイヤー名の取得
loot replace block ~ -64 ~ container.0 loot arena_normal:misc/player_head
data modify storage arena_normal:temp Recording.Compound.Name set from block ~ -64 ~ Items[{Slot:0b}].tag.SkullOwner.Name

# タイムスタンプ
execute store result storage arena_normal:temp Recording.Compound.TimeStamp int 1 run time query gametime

# データベースに挿入
    # 実行回数カウント = 0
    data modify storage arena_normal:temp Recording.Insertion.counter set value 0
    execute store result score #Recording.counter Arena.Temp run data get storage arena_normal:temp Recording.Insertion.counter

    # データセット
    $data modify storage arena_normal:temp Recording.Insertion.Categoried set from storage arena:records normal[{name:"$(name)"}].data
    data modify storage arena_normal:temp Recording.Insertion.name set from entity @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] data.Arena.Spawning.Detail.name

    data modify storage arena_normal:temp Recording.Insertion.UUID set from storage arena_normal:temp Recording.Compound.UUID

    # 重複データの有無を確認
    function arena_normal:recording/insertion/dupe_check with storage arena_normal:temp Recording.Insertion

    # 挿入
    # tellraw awabi2048 {"nbt":"Recording.Insertion","storage":"arena_normal:temp"}
    execute if data storage arena_normal:temp {Recording:{Insertion:{Execute:true}}} run function arena_normal:recording/insertion/_ with storage arena_normal:temp Recording.Insertion

#> 再起
# tag @s add Arena.Temp-RecordRegistered
# execute as @r[tag=arena.normal-stage.Player,tag=!Arena.Temp-RecordRegistered,distance=..48] run function arena_normal:recording/register with entity @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] data.Arena.stage_data

