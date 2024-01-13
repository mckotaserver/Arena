## 
#> データ作成
# プレイヤー名取得
setblock ~ -64 ~ bedrock replace
setblock ~ -64 ~ barrel replace

loot replace block ~ -64 ~ container.0 loot arena_normal:misc/player_head
data modify storage arena:temp Stats.PlayerName set from block ~ -64 ~ Items[{Slot:0b}].tag.SkullOwner.Name

setblock ~ -64 ~ bedrock replace

# 登録
function arena_normal:recording/stats/macro with storage arena:temp Stats

#> 再起
tag @s add Arena.Temp-StatsRegistered
execute as @r[tag=Arena.Normal-Stage.Player,tag=!Arena.Temp-StatsRegistered,distance=..48] at @s run function arena_normal:recording/stats/_

