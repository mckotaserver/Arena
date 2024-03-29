## カウントダウン時
# マーカーからデータコピー
data modify storage arena_normal:temp misc.countdown set from entity @s data.arena.misc.countdown

# マーカーに1引いてデータ戻す
execute store result entity @s data.arena.misc.countdown int 0.999 run data get storage arena_normal:temp misc.countdown

# countdown: 0 ならウェーブ開始
execute if data storage arena_normal:temp {misc:{countdown:0}} run scoreboard players reset @p[tag=arena.normal_stage.core_player] arena.timer
execute if data storage arena_normal:temp {misc:{countdown:0}} run function arena_normal:wave_process/_ with entity @s data.arena.stage_data

execute if data storage arena_normal:temp {misc:{countdown:0}} run return 0

# タイマー
scoreboard players set @p[tag=arena.normal_stage.core_player] arena.timer 20
data modify entity @s data.arena.scheduler.command set value "function arena_normal:wave_process/count_down"

# 残りカウント 5以下 → 演出
    # カウントをスコアで取得
    execute store result score #misc.countdown arena.temp run data get storage arena_normal:temp misc.countdown

    # 6以上なら処理は中断
    execute if score #misc.countdown arena.temp matches 6.. unless score #misc.countdown arena.temp matches 10 unless score #misc.countdown arena.temp matches 20 run return 0

    # tellraw / title
    title @a[tag=arena.normal_stage.player,distance=..48] title ""
    title @a[tag=arena.normal_stage.player,distance=..48] times 6t 40t 10t

    tellraw @a[tag=arena.normal_stage.player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_countdown-tellraw","with":[{"nbt":"misc.countdown","storage":"arena_normal:temp","color": "yellow","underlined": true}]}]
    title @a[tag=arena.normal_stage.player,distance=..48] subtitle {"translate":"kota-server.arena.game.message.wave_countdown-title","with":[{"nbt":"misc.countdown","storage":"arena_normal:temp","color": "yellow"}]}

    # playsound
    execute as @a[tag=arena.normal_stage.player,distance=..48] at @s run playsound ui.button.click master @s ~ ~ ~ 1 2
