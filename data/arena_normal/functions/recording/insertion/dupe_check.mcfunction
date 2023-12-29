## 重複関連

execute store result score #Recording.DupedUUID-New Arena.Temp run data get storage arena:temp Recording.Compound.Record
$execute store result score #Recording.DupedUUID-Old Arena.Temp run data get storage arena:records normal[{MobType:$(MobType)}].data[{UUID:$(UUID)}].Record

execute store success storage arena:temp Recording.Insertion.Execute byte 1 if score #Recording.DupedUUID-New Arena.Temp < #Recording.DupedUUID-Old Arena.Temp

# 重複UUIDデータ: 速さ 新 > 旧 の場合 → 旧データを削除
$execute if data storage arena:temp {Recording:{Insertion:{Execute:true}}} run data remove storage arena:records normal[{MobType:$(MobType)}].data[{UUID:$(UUID)}]
