## データを適切な位置へ挿入
$say Counter $(Counter)
# [n]番目のデータと挿入予定データを取得
scoreboard players set #Recording.Comparing Arena.Temp 0
scoreboard players set #Recording.Insertee Arena.Temp 0

$execute store result score #Recording.Comparing Arena.Temp run data get storage arena:temp Recording.Insertion.Categoried[$(Counter)].Record
execute store result score #Recording.Insertee Arena.Temp run data get storage arena:temp Recording.Compound.Record

# 確認中のデータが同じプレイヤーのもの かつ 新データより遅い記録なら削除. 新データが旧データより遅ければ処理を中断
data modify storage arena:temp Recording.Insertion.RecordOwner set value []
$data modify storage arena:temp Recording.Insertion.RecordOwner set from storage arena:temp Recording.Insertion.Categoried[$(Counter)].UUID
execute store success storage arena:temp Recording.Insertion.isDifferentOwner byte 1 run data modify storage arena:temp Recording.Insertion.RecordOwner set from storage arena:temp Recording.Compound.UUID

$execute if data storage arena:temp {Recording:{Insertion:{isDifferentOwner:false}}} if score #Recording.Comparing Arena.Temp > #Recording.Insertee Arena.Temp run data remove storage arena:records normal[{MobType:$(MobType)}].data[$(Counter)]
execute if data storage arena:temp {Recording:{Insertion:{isDifferentOwner:false}}} if score #Recording.Comparing Arena.Temp <= #Recording.Insertee Arena.Temp run return -1

# 比較, C ≧ I となるなら直前に挿入 (& 処理終了)
$execute if score #Recording.Comparing Arena.Temp >= #Recording.Insertee Arena.Temp run data modify storage arena:records normal[{MobType:$(MobType)}].data insert $(Counter) from storage arena:temp Recording.Compound
execute if score #Recording.Comparing Arena.Temp >= #Recording.Insertee Arena.Temp run return -1

# それ以外なら Counter +1 して再起
execute store result score #Recording.Counter Arena.Temp run data get storage arena:temp Recording.Insertion.Counter
scoreboard players add #Recording.Counter Arena.Temp 1

# 最後まで適切な位置が見つからなければ最後尾に
$execute unless data storage arena:temp Recording.Insertion.Categoried[$(Counter)] run data modify storage arena:records normal[{MobType:$(MobType)}].data append from storage arena:temp Recording.Compound
$execute unless data storage arena:temp Recording.Insertion.Categoried[$(Counter)] run return -1

execute store result storage arena:temp Recording.Insertion.Counter int 1 run scoreboard players get #Recording.Counter Arena.Temp
function arena_normal:recording/insertion/_ with storage arena:temp Recording.Insertion

