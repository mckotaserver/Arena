## 統計情報
# 設定されていなければ新規作成
$execute unless data storage arena:stats normal[{Name:$(playerName)}].Mobs[{mob_type:$(mob_type)}].data run data modify storage arena:stats normal[{Name:$(playerName)}].Mobs[{mob_type:$(mob_type)}].data set value [0, 0, 0]
$execute unless data storage arena:stats normal[{Name:$(playerName)}].Mobs[{mob_type:$(mob_type)}] run data modify storage arena:stats normal[{Name:$(playerName)}].Mobs append value {mob_type:$(mob_type)}

# 値を取得
$execute store result score #stats.Value arena.temp run data get storage arena:stats normal[{Name:$(playerName)}].Mobs[{mob_type:$(mob_type)}].data[$(difficulty)]

# 1 加算
scoreboard players add #stats.Value arena.temp 1

# データ戻す
$execute store result storage arena:stats normal[{Name:$(playerName)}].Mobs[{mob_type:$(mob_type)}].data[$(difficulty)] int 1 run scoreboard players get #stats.Value arena.temp
