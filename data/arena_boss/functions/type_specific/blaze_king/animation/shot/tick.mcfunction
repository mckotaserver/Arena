tp @s ^ ^ ^-0.5
execute as @a[tag=Arena.Boss.Player,dx=0] positioned ~-0.95 ~-0.95 ~-0.95 as @s[dx=0] at @s run damage @s 15 arena_boss:bypasses_cooldown

execute unless block ~ ~ ~ air run kill @e[tag=Arena.Boss.Main.Extra-08,sort=nearest,limit=1]
execute unless block ~ ~ ~ air run kill @s
