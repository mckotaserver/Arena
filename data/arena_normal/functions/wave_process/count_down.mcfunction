## カウントダウン時
# tellraw / title
title @a[tag=Arena.Normal-Stage.Player,distance=..48] title ""
title @a[tag=Arena.Normal-Stage.Player,distance=..48] times 6t 40t 10t

$tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_countdown-tellraw","with":[{"text": "$(Countdown)","color": "yellow","underlined":true}]}]
$title @a[tag=Arena.Normal-Stage.Player,distance=..48] subtitle {"translate":"kota-server.arena.game.message.wave_countdown-title","with":[{"text": "$(Countdown)","color": "yellow"}]}

# playsound
execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound ui.button.click master @s ~ ~ ~ 1 2

