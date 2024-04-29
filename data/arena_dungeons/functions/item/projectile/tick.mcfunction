# particle
$particle $(particle_name) ~ ~ ~ $(particle_option)

# 
$execute if data entity @s {data:{arena:{dungeons:{projectile_data:{collision:"player"}}}}} as @a[tag=arena.dungeons.player,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] run function $(on_collision)
$execute if data entity @s {data:{arena:{dungeons:{projectile_data:{collision:"mob"}}}}} as @a[tag=arena.dungeons.mob,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] run function $(on_collision)

# motion
$tp @s ^ ^ ^$(motion)

