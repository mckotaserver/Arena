## 
#> データ作成
# プレイヤー名取得
setblock ~ -64 ~ bedrock replace
setblock ~ -64 ~ barrel replace

loot replace block ~ -64 ~ container.0 loot arena_normal:misc/player_head
data modify storage arena_normal:temp stats.playerName set from block ~ -64 ~ Items[{Slot:0b}].tag.SkullOwner.Name

setblock ~ -64 ~ bedrock replace

# 登録
function arena_normal:recording/stats/macro with storage arena_normal:temp stats

#> 再起
tag @s add arena.temp.stats_registered
execute as @r[tag=arena.normal_stage.player,tag=!arena.temp.stats_registered,distance=..48] at @s run function arena_normal:recording/stats/_

