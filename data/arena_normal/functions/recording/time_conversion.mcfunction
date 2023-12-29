## tick → 単位変換
# データのコピー
execute store result score #Recording.Time-Hour Arena.Temp run data get storage arena:temp Recording.Time.Tick
execute store result score #Recording.Time-Minute Arena.Temp run data get storage arena:temp Recording.Time.Tick
execute store result score #Recording.Time-Second Arena.Temp run data get storage arena:temp Recording.Time.Tick
execute store result score #Recording.Time-Decimal Arena.Temp run data get storage arena:temp Recording.Time.Tick

#> 割り算でスコアを整形
# 時間
scoreboard players operation #Recording.Time-Hour Arena.Temp /= #20 Constant
scoreboard players operation #Recording.Time-Hour Arena.Temp /= #60 Constant
scoreboard players operation #Recording.Time-Hour Arena.Temp /= #60 Constant

execute store result storage arena:temp Recording.Time.Raw.Hour int 1 run scoreboard players get #Recording.Time-Hour Arena.Temp

# 分 
scoreboard players operation #Recording.Time-Minute Arena.Temp /= #20 Constant
scoreboard players operation #Recording.Time-Minute Arena.Temp /= #60 Constant
scoreboard players operation #Recording.Time-Minute Arena.Temp %= #60 Constant

execute store result storage arena:temp Recording.Time.Raw.Minute int 1 run scoreboard players get #Recording.Time-Minute Arena.Temp

# 秒
scoreboard players operation #Recording.Time-Second Arena.Temp /= #20 Constant
scoreboard players operation #Recording.Time-Second Arena.Temp %= #60 Constant

execute store result storage arena:temp Recording.Time.Raw.Second int 1 run scoreboard players get #Recording.Time-Second Arena.Temp

# 小数点以下
scoreboard players operation #Recording.Time-Decimal Arena.Temp %= #20 Constant
scoreboard players operation #Recording.Time-Decimal Arena.Temp *= #5 Constant

execute store result storage arena:temp Recording.Time.Raw.Decimal int 1 run scoreboard players get #Recording.Time-Decimal Arena.Temp

#> 表示データの作成 (0パディングもするよ)
# リセット
data modify storage arena:temp Recording.Time.Display set value []

# 時間
data modify storage arena:temp Recording.Time.Display append string storage arena:temp Recording.Time.Raw.Hour

data modify storage arena:temp Recording.Time.Display append value ":"

# 分
execute if score #Recording.Time-Minute Arena.Temp matches ..9 run data modify storage arena:temp Recording.Time.Display append value "0"

data modify storage arena:temp Recording.Time.Display append string storage arena:temp Recording.Time.Raw.Minute
data modify storage arena:temp Recording.Time.Display append value ":"

# 秒
execute if score #Recording.Time-Second Arena.Temp matches ..9 run data modify storage arena:temp Recording.Time.Display append value "0"

data modify storage arena:temp Recording.Time.Display append string storage arena:temp Recording.Time.Raw.Second
data modify storage arena:temp Recording.Time.Display append value "."

# 小数点以下
execute if score #Recording.Time-Decimal Arena.Temp matches ..9 run data modify storage arena:temp Recording.Time.Display append value "0"

data modify storage arena:temp Recording.Time.Display append string storage arena:temp Recording.Time.Raw.Decimal
