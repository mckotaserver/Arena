## ステージから離れたプレイヤー
# タグ除去
tag @s remove arena.normal_stage.player
tag @s remove arena.normal_stage.core_player

# スコアリセット
scoreboard players reset @s arena.player_id
scoreboard players reset @s arena.timer
