## Coreplayerの選出
# IDが最も大きいプレイヤーを取得
scoreboard players set #player_id.Max arena.temp -1
scoreboard players operation #player_id.Max arena.temp > @a[tag=arena.normal_stage.player,distance=..64] arena.player_id

# IDが最も大きいプレイヤーにタグを付与
execute as @a[tag=arena.normal_stage.player,distance=..64] if score @s arena.player_id = #player_id.Max arena.temp run tag @s add arena.normal_stage.core_player
