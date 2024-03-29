## タイマー処理 カウント終了時; マクロからコマンドの実行
# 諸データの削除
data modify entity @s data.arena.scheduler.command set value ""
scoreboard players reset @p[tag=arena.normal_stage.core_player] arena.timer

# 実行
$$(command)

# $tellraw awabi2048 {"text":"[MAIN] Executing: \"$(command)\"","color":"gray"}
