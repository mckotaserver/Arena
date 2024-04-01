## ロビーへのテレポート
# タグ付与
tag @p add arena.temp.player_transfer

# TP
$execute at @e[tag=$(tag)] run tp @a[tag=arena.temp.player_transfer] ~ ~-0.5 ~ ~ ~

# 演出
$execute at @e[tag=$(tag)] run playsound entity.enderman.teleport master @a[tag=arena.temp.player_transfer] ~ ~ ~ 0.5 1
$execute at @e[tag=$(tag)] run particle portal ~ ~ ~ 0.5 0.5 0.5 0.1 20

# motion打ち消し
execute as @a[tag=arena.temp.player_transfer] run tp @s @s 

# 一時タグ除去
tag @a[tag=arena.temp.player_transfer] remove arena.temp.player_transfer
