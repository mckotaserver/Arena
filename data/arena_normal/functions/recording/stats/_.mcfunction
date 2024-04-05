## 
#> データ作成
function kota_library:misc/get_player_name
data modify storage arena_normal:temp stats.playerName set from storage kota_library: get_player_name.out

# 登録
function arena_normal:recording/stats/macro with storage arena_normal:temp stats

#> 再起
tag @s add arena.temp.stats_registered
execute as @r[tag=arena.normal_stage.player,tag=!arena.temp.stats_registered,distance=..32] at @s run function arena_normal:recording/stats/_

