## データベースへの登録
# 一時ストレージに格納
data modify storage arena:temp Recording.Compound set value {}

#> 各データをまとめ
# 表示データ作成
data modify storage arena:temp Recording.Compound.DisplayData set value ["Wave"," ",""]
data modify storage arena:temp Recording.Compound.DisplayData[2] set string entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.Wave

# 実記録 (Wave)
data modify storage arena:temp Recording.Compound.Record set from entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.Wave

# UUID
data modify storage arena:temp Recording.Compound.UUID set from entity @s UUID

# プレイヤー名の取得
loot replace block ~ -64 ~ container.0 loot arena_normal:misc/player_head
data modify storage arena:temp Recording.Compound.Name set from block ~ -64 ~ Items[{Slot:0b}].tag.SkullOwner.Name

# タイムスタンプ
execute store result storage arena:temp Recording.Compound.TimeStamp int 1 run time query gametime

# データベースに挿入
    # 実行回数カウント = 0
    data modify storage arena:temp Recording.Insertion.Counter set value 0
    execute store result score #Recording.Counter Arena.Temp run data get storage arena:temp Recording.Insertion.Counter

    # データセット
    data modify storage arena:temp Recording.Insertion.Categoried set from storage arena:records normal[{name:"エンドレス"}].data
    data modify storage arena:temp Recording.Insertion.name set value "エンドレス"

    data modify storage arena:temp Recording.Insertion.UUID set from storage arena:temp Recording.Compound.UUID

    # 重複データの有無を確認
    function arena_normal:recording/insertion/dupe_check with storage arena:temp Recording.Insertion

    # 挿入
    execute if data storage arena:temp {Recording:{Insertion:{Execute:true}}} run function arena_normal:recording/insertion/_ with storage arena:temp Recording.Insertion

#> 再起
# 
# tag @s add Arena.Temp-RecordRegistered
# execute as @r[tag=Arena.Normal-Stage.Player,tag=!Arena.Temp-RecordRegistered,distance=..48] run function arena_normal:recording/register with entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.StageData

