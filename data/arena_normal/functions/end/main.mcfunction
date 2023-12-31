## 終了 遅延後: 本処理
#> プレイヤー
# アイテムの回収 
tp @e[type=item,distance=..48] @r[tag=Arena.Normal-Stage.Player,distance=..48] 

# ステージリセット
function arena_normal:misc/stage_reset

# 記録表示
tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.clear_time","with":[{"nbt":"data.Arena.DisplayRecord","entity": "@s","color": "yellow"}]}]

#> ロビー抽選
# 適当なロビー(人いない) , すべて埋まってるならランダム を選択
execute as @e[tag=Arena.Normal-Stage.Lobby] if data entity @s {data:{Arena:{LobbyType:Normal}}} at @s unless entity @p[distance=..48] run tag @s add Arena.Temp-EmptyLobby

execute if entity @e[tag=Arena.Temp-EmptyLobby] as @a[tag=Arena.Normal-Stage.Player,distance=..48] as @e[tag=Arena.Normal-Stage.Lobby] at @s unless entity @p[distance=..48] run tag @s add Arena.Temp-LobbySelected-Pre
execute unless entity @e[tag=Arena.Temp-EmptyLobby] as @e[tag=Arena.Normal-Stage.Lobby] run tag @s add Arena.Temp-LobbySelected-Pre

tag @e[tag=Arena.Temp-LobbySelected-Pre,sort=random,limit=1] add Arena.Temp-LobbySelected

#> 選択されたロビーで演出等
# tp
tp @a[tag=Arena.Normal-Stage.Player,distance=..48] @e[tag=Arena.Temp-LobbySelected,limit=1]
tp @e[type=item,distance=..48] @e[tag=Arena.Temp-LobbySelected,limit=1]

# 演出
execute at @e[tag=Arena.Temp-LobbySelected,limit=1] run playsound entity.enderman.teleport master @s ~ ~ ~ 1 1

# タグ除去
tag @e[tag=Arena.Temp-LobbySelected] remove Arena.Temp-LobbySelected

tag @e[tag=Arena.Temp-LobbySelected-Pre] remove Arena.Temp-LobbySelected-Pre
tag @e[tag=Arena.Temp-EmptyLobby] remove Arena.Temp-EmptyLobby

