## プレイヤーIDの割り振り
# ランダムなプレイヤーに設定
scoreboard players operation @s Arena.PlayerID = #PlayerID Arena.Temp

# +1して再起
scoreboard players add #PlayerID Arena.Temp 1
execute as @r[distance=..4,scores={Arena.PlayerID=-1}] run function arena_normal:misc/set_player_id
