## データベースへの登録
# 一時ストレージに格納
data modify storage arena:temp Recording.Compound set value {}

#> 各データをまとめ
# 表示データ
data modify storage arena:temp Recording.Compound.DisplayData set from storage arena:temp Recording.Time.Display

# 実記録 (tick)
data modify storage arena:temp Recording.Compound.Record set from storage arena:temp Recording.Time.Tick

# モブ種類
data modify storage arena:temp Recording.Compound.MobType set from entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.StageData.MobType

# プレイヤー名の取得
loot replace block ~ -64 ~ container.0 loot arena_normal:misc/player_head
data modify storage arena:temp Recording.Compound.Name set from block ~ -64 ~ Items[{Slot:0b}].tag.SkullOwner.Name

# タイムスタンプ
execute store result storage arena:temp Recording.Compound.TimeStamp int 1 run time query gametime

# データベースに挿入
data modify storage arena:temp Recording.Insertion.Counter set value 0
function arena_normal:recording/data_insert with storage arena:temp Recording.Insertion

#> 再起
tag @s add Arena.Temp-RecordRegistered
execute as @r[tag=Arena.Normal-Stage.Player,tag=!Arena.Temp-RecordRegistered,distance=..48] run function arena_normal:recording/register

