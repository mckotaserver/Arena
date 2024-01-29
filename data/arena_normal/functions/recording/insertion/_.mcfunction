## データを適切な位置へ挿入
# [n]番目のデータと挿入予定データを取得
scoreboard players set #Recording.Comparing Arena.Temp 0
scoreboard players set #Recording.Insertee Arena.Temp 0

$execute store result score #Recording.Comparing Arena.Temp run data get storage arena:temp Recording.Insertion.Categoried[$(Counter)].Record
execute store result score #Recording.Insertee Arena.Temp run data get storage arena:temp Recording.Compound.Record

# 同UUIDのデータ遭遇時の処理
    # データ[n]のUUIDを取得
    data modify storage arena:temp Recording.Insertion.RecordOwner set value []
    $data modify storage arena:temp Recording.Insertion.RecordOwner set from storage arena:temp Recording.Insertion.Categoried[$(Counter)].UUID

    # 一致判定
    execute store success storage arena:temp Recording.Insertion.isDifferentOwner byte 1 run data modify storage arena:temp Recording.Insertion.RecordOwner set from storage arena:temp Recording.Compound.UUID

    # 一致 → 旧データは削除
    $execute if data storage arena:temp {Recording:{Insertion:{isDifferentOwner:false}}} run data remove storage arena:records normal[{name:"$(name)"}].data[$(Counter)]

# 比較 → 条件に一致なら挿入
    # 通常
    execute unless data storage arena:temp {Recording:{Insertion:{name:"エンドレス"}}} store success storage arena:temp Recording.Insertion.conditionMatched byte 1 if score #Recording.Comparing Arena.Temp > #Recording.Insertee Arena.Temp

    # エンドレス
    execute if data storage arena:temp {Recording:{Insertion:{name:"エンドレス"}}} store success storage arena:temp Recording.Insertion.conditionMatched byte 1 if score #Recording.Comparing Arena.Temp < #Recording.Insertee Arena.Temp

    # 挿入処理
    $execute if data storage arena:temp {Recording:{Insertion:{conditionMatched:true}}} run data modify storage arena:records normal[{name:"$(name)"}].data insert $(Counter) from storage arena:temp Recording.Compound
    execute if data storage arena:temp {Recording:{Insertion:{conditionMatched:true}}} run return 0

# 最後まで適切な位置が見つからなければ最後尾に
$execute unless data storage arena:temp Recording.Insertion.Categoried[$(Counter)] run data modify storage arena:records normal[{name:"$(name)"}].data append from storage arena:temp Recording.Compound
$execute unless data storage arena:temp Recording.Insertion.Categoried[$(Counter)] run return 0

# 挿入不可なら再起
    # Counter +1
    execute store result score #Recording.Counter Arena.Temp run data get storage arena:temp Recording.Insertion.Counter
    scoreboard players add #Recording.Counter Arena.Temp 1

    execute store result storage arena:temp Recording.Insertion.Counter int 1 run scoreboard players get #Recording.Counter Arena.Temp
    function arena_normal:recording/insertion/_ with storage arena:temp Recording.Insertion

