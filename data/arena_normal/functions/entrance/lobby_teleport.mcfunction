## ロビーへのテレポート
# TP
$execute at @e[tag=Arena.Normal-Stage.Lobby_$(LobbyName)] run tp @p ~ ~-0.5 ~ ~ ~

# 演出
$execute at @e[tag=Arena.Normal-Stage.Lobby_$(LobbyName)] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1
$execute at @e[tag=Arena.Normal-Stage.Lobby_$(LobbyName)] run particle portal ~ ~ ~ 0.5 0.5 0.5 0.1 20

# motion打ち消し
execute as @p run tp @s @s 

# displayが設置されていない場合: 召喚
$execute at @e[tag=Arena.Normal-Stage.Lobby_$(LobbyName)] positioned ~ ~ ~7 unless entity @e[tag=Arena.Normal-Stage.Selector-Core,distance=..1] run summon marker ~ ~ ~ {Tags:["Arena.Normal-Stage.Selector-Core"]}

# リセット処理
$execute as @e[tag=Arena.Normal-Stage.Lobby_$(LobbyName)] if data entity @s {data:{Arena:{LobbyType:Normal}}} at @s as @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] at @s run function arena_normal:entrance/stage_selector/reset_normal
$execute as @e[tag=Arena.Normal-Stage.Lobby_$(LobbyName)] if data entity @s {data:{Arena:{LobbyType:Endless}}} at @s as @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] at @s run function arena_normal:entrance/stage_selector/reset_endless

