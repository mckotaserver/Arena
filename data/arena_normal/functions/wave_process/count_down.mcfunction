## カウントダウン時
# マーカーからデータコピー
data modify storage arena_normal:temp misc.countdown set from entity @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] data.Arena.misc.countdown

# マーカーに1引いてデータ戻す
execute store result entity @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] data.Arena.misc.countdown int 0.999 run data get storage arena_normal:temp misc.countdown

# タイマー
scoreboard players set @p[tag=arena.normal-stage.Core-Player] Arena.Timer 20

# countdown: 0 ならウェーブ開始
execute if data storage arena_normal:temp {misc:{countdown:0}} as @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] at @s run function arena_normal:wave_process/_ with entity @s data.Arena.stage_data

execute if data storage arena_normal:temp {misc:{countdown:0}} at @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] run scoreboard players reset @p[tag=arena.normal-stage.Core-Player] Arena.Timer
execute if data storage arena_normal:temp {misc:{countdown:0}} as @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] run return 0

# 残りカウント 5以下 → 演出
    # カウントをスコアで取得
    execute store result score #misc.countdown Arena.Temp run data get storage arena_normal:temp misc.countdown

    # 6以上なら処理は中断
    execute if score #misc.countdown Arena.Temp matches 6.. unless score #misc.countdown Arena.Temp matches 10 unless score #misc.countdown Arena.Temp matches 20 run return 0

    # tellraw / title
    title @a[tag=arena.normal-stage.Player,distance=..48] title ""
    title @a[tag=arena.normal-stage.Player,distance=..48] times 6t 40t 10t

    tellraw @a[tag=arena.normal-stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_countdown-tellraw","with":[{"nbt":"misc.countdown","storage":"arena_normal:temp","color": "yellow","underlined": true}]}]
    title @a[tag=arena.normal-stage.Player,distance=..48] subtitle {"translate":"kota-server.arena.game.message.wave_countdown-title","with":[{"nbt":"misc.countdown","storage":"arena_normal:temp","color": "yellow"}]}

    # playsound
    execute as @a[tag=arena.normal-stage.Player,distance=..48] at @s run playsound ui.button.click master @s ~ ~ ~ 1 2
