## カウントダウン 表示等
# tellraw / title
title @a[tag=arena.boss.player,distance=..128] title ""
title @a[tag=arena.boss.player,distance=..128] times 6t 40t 10t

$tellraw @a[tag=arena.boss.player,distance=..128] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.game.message.start_countdown","with":[{"text": "$(Countdown)","color": "gold","underlined":true}]}]
$title @a[tag=arena.boss.player,distance=..128] subtitle {"translate":"kota-server.arena.game.message.wave_countdown-title","with":[{"text": "$(Countdown)","color": "red"}]}

# playsound
execute as @a[tag=arena.boss.player,distance=..128] at @s run playsound ui.button.click master @s ~ ~ ~ 1 2

