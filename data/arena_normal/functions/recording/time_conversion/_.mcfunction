## tick → 単位変換
# データのコピー
execute store result score #recording.Time-Hour arena.temp run data get storage arena_normal:temp recording.Time.Tick
execute store result score #recording.Time-Minute arena.temp run data get storage arena_normal:temp recording.Time.Tick
execute store result score #recording.Time-Second arena.temp run data get storage arena_normal:temp recording.Time.Tick
execute store result score #recording.Time-Decimal arena.temp run data get storage arena_normal:temp recording.Time.Tick

#> 割り算でスコアを整形
# 時間
scoreboard players operation #recording.Time-Hour arena.temp /= #20 Constant
scoreboard players operation #recording.Time-Hour arena.temp /= #60 Constant
scoreboard players operation #recording.Time-Hour arena.temp /= #60 Constant

execute store result storage arena_normal:temp recording.Time.Raw.Hour int 1 run scoreboard players get #recording.Time-Hour arena.temp

# 分 
scoreboard players operation #recording.Time-Minute arena.temp /= #20 Constant
scoreboard players operation #recording.Time-Minute arena.temp /= #60 Constant
scoreboard players operation #recording.Time-Minute arena.temp %= #60 Constant

execute store result storage arena_normal:temp recording.Time.Raw.Minute int 1 run scoreboard players get #recording.Time-Minute arena.temp

# 秒
scoreboard players operation #recording.Time-Second arena.temp /= #20 Constant
scoreboard players operation #recording.Time-Second arena.temp %= #60 Constant

execute store result storage arena_normal:temp recording.Time.Raw.Second int 1 run scoreboard players get #recording.Time-Second arena.temp

# 小数点以下
scoreboard players operation #recording.Time-Decimal arena.temp %= #20 Constant
scoreboard players operation #recording.Time-Decimal arena.temp *= #5 Constant

execute store result storage arena_normal:temp recording.Time.Raw.Decimal int 1 run scoreboard players get #recording.Time-Decimal arena.temp

#> 表示データの作成 (0パディングもするよ)
function arena_normal:recording/time_conversion/zero_padding with storage arena_normal:temp recording.Time.Raw
