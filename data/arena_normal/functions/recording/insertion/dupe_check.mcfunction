## 重複関連
# そもそも重複がなければ処理は停止
$execute store success storage arena:temp Recording.Insertion.hasDupedRecord byte 1 if data storage arena:records normal[{name:"$(name)"}].data[{UUID:$(UUID)}] 

execute if data storage arena:temp {Recording:{Insertion:{hasDupedRecord:false}}} run data modify storage arena:temp Recording.Insertion.Execute set value true
execute if data storage arena:temp {Recording:{Insertion:{hasDupedRecord:false}}} run return -1

# 新旧記録を取得
execute store result score #Recording.DupedUUID-New Arena.Temp run data get storage arena:temp Recording.Compound.Record
$execute store result score #Recording.DupedUUID-Old Arena.Temp run data get storage arena:records normal[{name:"$(name)"}].data[{UUID:$(UUID)}].Record

# 比較
execute store success storage arena:temp Recording.Insertion.Execute byte 1 if score #Recording.DupedUUID-New Arena.Temp < #Recording.DupedUUID-Old Arena.Temp

    # エンドレスなら結果を反転
    execute if data storage arena:temp {Recording:{Innsertion:{name:"エンドレス"}}} unless score #Recording.DupedUUID-New Arena.Temp = #Recording.DupedUUID-Old Arena.Temp store result storage arena:temp Recording.Insertion.Execute byte 1 if data storage arena:temp {Recording:{Insertion:{Execute:false}}}

# 重複UUIDデータ: 通常; データ 新 < 旧 の場合 → データベースから旧データを削除 (エンドレス; 逆)
$execute if data storage arena:temp {Recording:{Insertion:{Execute:true}}} run data remove storage arena:records normal[{name:"$(name)"}].data[{UUID:$(UUID)}]

