## 記録関連処理: 終了時
#> 時間データの整形
# リセット
data modify storage arena:temp Recording set value {}

# 現在時刻と開始時刻を取得
execute store result score #CurrentTick Arena.Temp run time query gametime
execute store result score #Recording.StartTick Arena.Temp run data get entity @s data.Arena.Recording.StartTick

# 差分の計算, 最大値 (719999t = 9:59:59.95) を超える場合は上限設定
scoreboard players operation #CurrentTick Arena.Temp -= #Recording.StartTick Arena.Temp
execute if score #CurrentTick Arena.Temp matches 720000.. run scoreboard players set #CurrentTick Arena.Temp 719999

execute store result storage arena:temp Recording.Time.Tick int 1 run scoreboard players get #CurrentTick Arena.Temp

# 時 / 分 / 秒 / 小数点以下 に変換, 表示データの作成
function arena_normal:recording/time_conversion/_

#> データベースへの登録
setblock ~ -64 ~ air replace
setblock ~ -64 ~ barrel replace

execute as @r[tag=Arena.Normal-Stage.Player,distance=..48] run function arena_normal:recording/register with entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.StageData
tag @a[tag=Arena.Temp-RecordRegistered] remove Arena.Temp-RecordRegistered

setblock ~ -64 ~ air replace
