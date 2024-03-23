## ロビーへのテレポート
# タグ付与
tag @p add Arena.Temp-PlayerTransfer

# TP
$execute at @e[tag=arena.normal-stage.Base_$(Name)] run tp @a[tag=arena.Temp-PlayerTransfer] ~ ~-0.5 ~ ~ ~

# 演出
$execute at @e[tag=arena.normal-stage.Base_$(Name)] run playsound entity.enderman.teleport master @a[tag=arena.Temp-PlayerTransfer] ~ ~ ~ 0.5 1
$execute at @e[tag=arena.normal-stage.Base_$(Name)] run particle portal ~ ~ ~ 0.5 0.5 0.5 0.1 20

# motion打ち消し
execute as @a[tag=arena.Temp-PlayerTransfer] run tp @s @s 

# 一時タグ除去
tag @a[tag=arena.Temp-PlayerTransfer] remove Arena.Temp-PlayerTransfer
