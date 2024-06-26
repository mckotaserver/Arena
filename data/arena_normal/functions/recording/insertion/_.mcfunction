## データを適切な位置へ挿入
# [n]番目のデータと挿入予定データを取得
scoreboard players set #recording.Comparing arena.temp 0
scoreboard players set #recording.Insertee arena.temp 0

$execute store result score #recording.Comparing arena.temp run data get storage arena_normal:temp recording.insertion.categoried[$(counter)].record
execute store result score #recording.Insertee arena.temp run data get storage arena_normal:temp recording.compound.record

# 同UUIDのデータ遭遇時の処理
    # データ[n]のUUIDを取得
    data modify storage arena_normal:temp recording.insertion.recordOwner set value []
    $data modify storage arena_normal:temp recording.insertion.recordOwner set from storage arena_normal:temp recording.insertion.categoried[$(counter)].UUID

    # 一致判定
    execute store success storage arena_normal:temp recording.insertion.isDifferentOwner byte 1 run data modify storage arena_normal:temp recording.insertion.recordOwner set from storage arena_normal:temp recording.compound.UUID

    # 一致 → 旧データは削除
    $execute if data storage arena_normal:temp {recording:{insertion:{isDifferentOwner:false}}} run data remove storage arena:records normal[{name:"$(name)"}].data[$(counter)]

# 比較 → 条件に一致なら挿入
    # 通常
    execute unless data storage arena_normal:temp {recording:{insertion:{name:"エンドレス"}}} store success storage arena_normal:temp recording.insertion.conditionMatched byte 1 if score #recording.Comparing arena.temp > #recording.Insertee arena.temp

    # エンドレス
    execute if data storage arena_normal:temp {recording:{insertion:{name:"エンドレス"}}} store success storage arena_normal:temp recording.insertion.conditionMatched byte 1 if score #recording.Comparing arena.temp < #recording.Insertee arena.temp

    # 挿入処理
    $execute if data storage arena_normal:temp {recording:{insertion:{conditionMatched:true}}} run data modify storage arena:records normal[{name:"$(name)"}].data insert $(counter) from storage arena_normal:temp recording.compound
    execute if data storage arena_normal:temp {recording:{insertion:{conditionMatched:true}}} run return 0

# 最後まで適切な位置が見つからなければ最後尾に
$execute unless data storage arena_normal:temp recording.insertion.categoried[$(counter)] run data modify storage arena:records normal[{name:"$(name)"}].data append from storage arena_normal:temp recording.compound
$execute unless data storage arena_normal:temp recording.insertion.categoried[$(counter)] run return 0

# 挿入不可なら再起
    # counter +1
    execute store result score #recording.counter arena.temp run data get storage arena_normal:temp recording.insertion.counter
    scoreboard players add #recording.counter arena.temp 1

    execute store result storage arena_normal:temp recording.insertion.counter int 1 run scoreboard players get #recording.counter arena.temp
    function arena_normal:recording/insertion/_ with storage arena_normal:temp recording.insertion

