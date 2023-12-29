# 移動時処理
# 距離に応じた速度で移動
execute if data storage arena-boss: {Animation:{Flag:{NoMove:false}}} if entity @p[distance=2..] facing entity @a[tag=ArenaBoss.Target,limit=1] eyes rotated ~ 0 run tp @s ^ ^ ^0.25 ~ ~ 

execute as @e[tag=ArenaBoss.Part01,distance=..2] positioned as @s in minecraft:arena run tp @s ~ ~ ~ ~ ~

# 位置同期
execute positioned as @s in minecraft:arena run tp @e[tag=ArenaBoss.Hitbox,limit=1] ~ ~ ~
execute positioned as @s in minecraft:arena run tp @e[tag=ArenaBoss.Element-Parts,limit=1] ~ ~ ~
