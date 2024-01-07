## 終了 遅延後: 本処理
#> プレイヤー
# アイテムの回収 
tp @e[type=item,distance=..48] @r[tag=Arena.Normal-Stage.Player,distance=..48] 

# ステージリセット
function arena_normal:misc/stage_reset

#> 記録まわり
    # 本人tellraw
    tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.clear_time","with":[{"nbt":"data.Arena.DisplayRecord","entity": "@s","color": "yellow"}]}]

    # 記録更新 → 特殊表示 & 鯖内通知
    

#> ロビーtp等
# tp
$tp @a[tag=Arena.Normal-Stage.Player,distance=..48] @e[tag=Arena.Normal-Stage.Lobby_$(EnteredLobby)limit=1]
$tp @e[type=item,distance=..48] @e[tag=Arena.Normal-Stage.Lobby_$(EnteredLobby)limit=1]

# 演出
$execute at @e[tag=Arena.Normal-Stage.Lobby_$(EnteredLobby)limit=1] run playsound entity.enderman.teleport master @s ~ ~ ~ 1 1
