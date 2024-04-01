## 重複関連
# そもそも重複がなければ処理は停止
$execute store success storage arena_normal:temp recording.insertion.has_duped_record byte 1 if data storage arena:records normal[{name:"$(name)"}].data[{UUID:$(UUID)}] 

execute if data storage arena_normal:temp {recording:{insertion:{has_duped_record:false}}} run data modify storage arena_normal:temp recording.insertion.execute set value true
execute if data storage arena_normal:temp {recording:{insertion:{has_duped_record:false}}} run return 0

# 新旧記録を取得
execute store result score #recording.duped_uuid_new arena.temp run data get storage arena_normal:temp recording.compound.record
$execute store result score #recording.duped_uuid_old arena.temp run data get storage arena:records normal[{name:"$(name)"}].data[{UUID:$(UUID)}].record

# 比較
execute store success storage arena_normal:temp recording.insertion.execute byte 1 if score #recording.duped_uuid_new arena.temp < #recording.duped_uuid_old arena.temp

    # エンドレスなら結果を反転
    execute if data storage arena_normal:temp {recording:{insertion:{name:"エンドレス"}}} unless score #recording.duped_uuid_new arena.temp = #recording.duped_uuid_old arena.temp store result storage arena_normal:temp recording.insertion.execute byte 1 if data storage arena_normal:temp {recording:{insertion:{execute:false}}}

# 重複UUIDデータ: 通常; データ 新 < 旧 の場合 → データベースから旧データを削除 (エンドレス; 逆)
$execute if data storage arena_normal:temp {recording:{insertion:{execute:true}}} run data remove storage arena:records normal[{name:"$(name)"}].data[{UUID:$(UUID)}]

