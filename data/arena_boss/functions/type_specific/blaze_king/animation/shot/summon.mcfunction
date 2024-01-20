execute rotated as @e[tag=Arena.Boss.Main.Element-08,sort=nearest,limit=1] run summon item_display ^ ^ ^0.1 {Tags:["Arena.Boss.Main.Extra-07","Arena.Boss.Main.Extras"],Rotation:[0.0f,0.0f],Passengers:[{id:"minecraft:small_fireball",Tags:["Arena.Boss.Main.Extra-08","Arena.Boss.Main.Extras"]}]}
$execute as @e[tag=Arena.Boss.Main.Extra-07,sort=nearest,limit=1] at @s facing entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] feet rotated ~$(Rotation) ~ run tp @s ~ ~ ~ ~ ~
execute run playsound item.firecharge.use master @a ~ ~ ~ 1 0.75
