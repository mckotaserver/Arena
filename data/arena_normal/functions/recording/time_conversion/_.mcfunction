## tick → 単位変換
# データのコピー
execute store result score #recording.time-Hour arena.temp run data get storage arena_normal:temp recording.time.tick
execute store result score #recording.time-Minute arena.temp run data get storage arena_normal:temp recording.time.tick
execute store result score #recording.time-Second arena.temp run data get storage arena_normal:temp recording.time.tick
execute store result score #recording.time-Decimal arena.temp run data get storage arena_normal:temp recording.time.tick

#> 割り算でスコアを整形
# 時間
scoreboard players operation #recording.time-Hour arena.temp /= #20 Constant
scoreboard players operation #recording.time-Hour arena.temp /= #60 Constant
scoreboard players operation #recording.time-Hour arena.temp /= #60 Constant

execute store result storage arena_normal:temp recording.time.Raw.Hour int 1 run scoreboard players get #recording.time-Hour arena.temp

# 分 
scoreboard players operation #recording.time-Minute arena.temp /= #20 Constant
scoreboard players operation #recording.time-Minute arena.temp /= #60 Constant
scoreboard players operation #recording.time-Minute arena.temp %= #60 Constant

execute store result storage arena_normal:temp recording.time.Raw.Minute int 1 run scoreboard players get #recording.time-Minute arena.temp

# 秒
scoreboard players operation #recording.time-Second arena.temp /= #20 Constant
scoreboard players operation #recording.time-Second arena.temp %= #60 Constant

execute store result storage arena_normal:temp recording.time.Raw.Second int 1 run scoreboard players get #recording.time-Second arena.temp

# 小数点以下
scoreboard players operation #recording.time-Decimal arena.temp %= #20 Constant
scoreboard players operation #recording.time-Decimal arena.temp *= #5 Constant

execute store result storage arena_normal:temp recording.time.Raw.Decimal int 1 run scoreboard players get #recording.time-Decimal arena.temp

#> 表示データの作成 (0パディングもするよ)
function arena_normal:recording/time_conversion/zero_padding with storage arena_normal:temp recording.time.Raw
