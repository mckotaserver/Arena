## 適切な位置に0を挿入する
# 時
$data modify storage arena_normal:temp Recording.Time.Merged.Hour set value $(Hour)

# 分
$execute if score #Recording.Time-Minute Arena.Temp matches 0..9 run data modify storage arena_normal:temp Recording.Time.Merged.Minute set value 0$(Minute)
$execute if score #Recording.Time-Minute Arena.Temp matches 10.. run data modify storage arena_normal:temp Recording.Time.Merged.Minute set value $(Minute)

# 秒
$execute if score #Recording.Time-Second Arena.Temp matches 0..9 run data modify storage arena_normal:temp Recording.Time.Merged.Second set value 0$(Second)
$execute if score #Recording.Time-Second Arena.Temp matches 10.. run data modify storage arena_normal:temp Recording.Time.Merged.Second set value $(Second)

# 小数点以下
$execute if score #Recording.Time-Decimal Arena.Temp matches 0..9 run data modify storage arena_normal:temp Recording.Time.Merged.Decimal set value 0$(Decimal)
$execute if score #Recording.Time-Decimal Arena.Temp matches 10.. run data modify storage arena_normal:temp Recording.Time.Merged.Decimal set value $(Decimal)

function arena_normal:recording/time_conversion/merge with storage arena_normal:temp Recording.Time.Merged
