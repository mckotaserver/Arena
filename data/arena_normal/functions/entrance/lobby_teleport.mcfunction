## ロビーへのテレポート
# タグ付与
tag @p add Arena.Temp-PlayerTransfer

# TP
$execute at @e[tag=arena.normal-stage.Lobby_$(lobby_name)] run tp @a[tag=arena.Temp-PlayerTransfer] ~ ~-0.5 ~ ~ ~

# 演出
$execute at @e[tag=arena.normal-stage.Lobby_$(lobby_name)] run playsound entity.enderman.teleport master @a[tag=arena.Temp-PlayerTransfer] ~ ~ ~ 0.5 1
$execute at @e[tag=arena.normal-stage.Lobby_$(lobby_name)] run particle portal ~ ~ ~ 0.5 0.5 0.5 0.1 20

# motion打ち消し
execute as @a[tag=arena.Temp-PlayerTransfer] run tp @s @s 

# 一時タグ除去
tag @a[tag=arena.Temp-PlayerTransfer] remove Arena.Temp-PlayerTransfer

# displayが設置されていない場合: 召喚
$execute at @e[tag=arena.normal-stage.Lobby_$(lobby_name)] positioned ^ ^-0.5 ^10 unless entity @e[tag=arena.normal-stage.Selector-Core,distance=..1] run summon marker ~ ~ ~ {Tags:["arena.normal-stage.Selector-Core","arena.normal-stage.Selector"]}

$execute as @e[tag=arena.normal-stage.Lobby_$(lobby_name)] at @s as @e[tag=arena.normal-stage.Selector-Core,sort=nearest,limit=1] facing ~ ~ ~ at @s run tp @s ~ ~ ~ ~ ~

# リセット処理
$execute as @e[tag=arena.normal-stage.Lobby_$(lobby_name)] if data entity @s {data:{Arena:{lobby_type:normal}}} at @s positioned ^ ^-0.5 ^10 as @e[tag=arena.normal-stage.Selector-Core,sort=nearest,limit=1] at @s run function arena_normal:entrance/stage_selector/reset_normal
$execute as @e[tag=arena.normal-stage.Lobby_$(lobby_name)] if data entity @s {data:{Arena:{lobby_type:endless}}} at @s positioned ^ ^-0.5 ^10 as @e[tag=arena.normal-stage.Selector-Core,sort=nearest,limit=1] at @s run function arena_normal:entrance/stage_selector/reset_endless

