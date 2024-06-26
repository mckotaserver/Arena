## 適切な位置に0を挿入する
# 時
$data modify storage arena_normal:temp recording.time.Merged.Hour set value $(Hour)

# 分
$execute if score #recording.time-Minute arena.temp matches 0..9 run data modify storage arena_normal:temp recording.time.Merged.Minute set value 0$(Minute)
$execute if score #recording.time-Minute arena.temp matches 10.. run data modify storage arena_normal:temp recording.time.Merged.Minute set value $(Minute)

# 秒
$execute if score #recording.time-Second arena.temp matches 0..9 run data modify storage arena_normal:temp recording.time.Merged.Second set value 0$(Second)
$execute if score #recording.time-Second arena.temp matches 10.. run data modify storage arena_normal:temp recording.time.Merged.Second set value $(Second)

# 小数点以下
$execute if score #recording.time-Decimal arena.temp matches 0..9 run data modify storage arena_normal:temp recording.time.Merged.Decimal set value 0$(Decimal)
$execute if score #recording.time-Decimal arena.temp matches 10.. run data modify storage arena_normal:temp recording.time.Merged.Decimal set value $(Decimal)

function arena_normal:recording/time_conversion/merge with storage arena_normal:temp recording.time.Merged
