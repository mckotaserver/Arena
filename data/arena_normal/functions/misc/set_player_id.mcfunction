## プレイヤーIDの割り振り
# ランダムなプレイヤーに設定
scoreboard players operation @s arena.player_id = #player_id arena.temp

# +1して再起
scoreboard players add #player_id arena.temp 1
execute as @r[distance=..4,scores={arena.player_id=-1}] run function arena_normal:misc/set_player_id
