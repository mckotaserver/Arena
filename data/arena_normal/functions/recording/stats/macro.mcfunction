## 統計情報
# 設定されていなければ新規作成
$execute unless data storage arena:stats normal[{Name:$(PlayerName)}].Mobs[{MobType:$(MobType)}].data run data modify storage arena:stats normal[{Name:$(PlayerName)}].Mobs[{MobType:$(MobType)}].data set value [0, 0, 0]
$execute unless data storage arena:stats normal[{Name:$(PlayerName)}].Mobs[{MobType:$(MobType)}] run data modify storage arena:stats normal[{Name:$(PlayerName)}].Mobs append value {MobType:$(MobType)}

# 値を取得
$execute store result score #Stats.Value Arena.Temp run data get storage arena:stats normal[{Name:$(PlayerName)}].Mobs[{MobType:$(MobType)}].data[$(Difficulty)]

# 1 加算
scoreboard players add #Stats.Value Arena.Temp 1

# データ戻す
$execute store result storage arena:stats normal[{Name:$(PlayerName)}].Mobs[{MobType:$(MobType)}].data[$(Difficulty)] int 1 run scoreboard players get #Stats.Value Arena.Temp
