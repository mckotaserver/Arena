## ロビーへのテレポート
# タグ付与
tag @p add Arena.Temp-PlayerTransfer

# TP
$execute at @e[tag=Arena.Normal-Stage.Lobby_$(Name)] run tp @a[tag=Arena.Temp-PlayerTransfer] ~ ~-0.5 ~ ~ ~

# 演出
$execute at @e[tag=Arena.Normal-Stage.Lobby_$(Name)] run playsound entity.enderman.teleport master @a[tag=Arena.Temp-PlayerTransfer] ~ ~ ~ 0.5 1
$execute at @e[tag=Arena.Normal-Stage.Lobby_$(Name)] run particle portal ~ ~ ~ 0.5 0.5 0.5 0.1 20

# motion打ち消し
execute as @a[tag=Arena.Temp-PlayerTransfer] run tp @s @s 

# 一時タグ除去
tag @a[tag=Arena.Temp-PlayerTransfer] remove Arena.Temp-PlayerTransfer

# displayが設置されていない場合: 召喚
$execute at @e[tag=Arena.Normal-Stage.Lobby_$(Name)] positioned ^ ^-0.5 ^10 unless entity @e[tag=Arena.Normal-Stage.Selector-Core,distance=..1] run summon marker ~ ~ ~ {Tags:["Arena.Normal-Stage.Selector-Core","Arena.Normal-Stage.Selector"]}

$execute as @e[tag=Arena.Normal-Stage.Lobby_$(Name)] at @s as @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] facing ~ ~ ~ at @s run tp @s ~ ~ ~ ~ ~

# リセット処理
$execute as @e[tag=Arena.Normal-Stage.Lobby_$(Name)] if data entity @s {data:{Arena:{LobbyType:Normal}}} at @s positioned ^ ^-0.5 ^10 as @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] at @s run function arena_normal:entrance/stage_selector/reset_normal
$execute as @e[tag=Arena.Normal-Stage.Lobby_$(Name)] if data entity @s {data:{Arena:{LobbyType:Endless}}} at @s positioned ^ ^-0.5 ^10 as @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] at @s run function arena_normal:entrance/stage_selector/reset_endless

