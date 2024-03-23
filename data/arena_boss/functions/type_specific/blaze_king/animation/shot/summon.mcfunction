execute rotated as @e[tag=arena.boss.Main.Element-08,sort=nearest,limit=1] run summon item_display ^ ^ ^0.1 {Tags:["arena.boss.Main.Extra-07","arena.boss.Main.Extras"],Rotation:[0.0f,0.0f],Passengers:[{id:"minecraft:small_fireball",Tags:["arena.boss.Main.Extra-08","arena.boss.Main.Extras"]}]}
$execute as @e[tag=arena.boss.Main.Extra-07,sort=nearest,limit=1] at @s facing entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] feet rotated ~$(Rotation) ~ run tp @s ~ ~ ~ ~ ~
execute run playsound item.firecharge.use master @a ~ ~ ~ 1 0.75
