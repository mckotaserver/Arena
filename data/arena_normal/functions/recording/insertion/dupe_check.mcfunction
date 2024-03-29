## 重複関連
# そもそも重複がなければ処理は停止
$execute store success storage arena_normal:temp recording.Insertion.hasDupedrecord byte 1 if data storage arena:records normal[{name:"$(name)"}].data[{UUID:$(UUID)}] 

execute if data storage arena_normal:temp {recording:{Insertion:{hasDupedrecord:false}}} run data modify storage arena_normal:temp recording.Insertion.Execute set value true
execute if data storage arena_normal:temp {recording:{Insertion:{hasDupedrecord:false}}} run return 0

# 新旧記録を取得
execute store result score #recording.DupedUUID-New arena.temp run data get storage arena_normal:temp recording.Compound.record
$execute store result score #recording.DupedUUID-Old arena.temp run data get storage arena:records normal[{name:"$(name)"}].data[{UUID:$(UUID)}].record

# 比較
execute store success storage arena_normal:temp recording.Insertion.Execute byte 1 if score #recording.DupedUUID-New arena.temp < #recording.DupedUUID-Old arena.temp

    # エンドレスなら結果を反転
    execute if data storage arena_normal:temp {recording:{Insertion:{name:"エンドレス"}}} unless score #recording.DupedUUID-New arena.temp = #recording.DupedUUID-Old arena.temp store result storage arena_normal:temp recording.Insertion.Execute byte 1 if data storage arena_normal:temp {recording:{Insertion:{Execute:false}}}

# 重複UUIDデータ: 通常; データ 新 < 旧 の場合 → データベースから旧データを削除 (エンドレス; 逆)
$execute if data storage arena_normal:temp {recording:{Insertion:{Execute:true}}} run data remove storage arena:records normal[{name:"$(name)"}].data[{UUID:$(UUID)}]

