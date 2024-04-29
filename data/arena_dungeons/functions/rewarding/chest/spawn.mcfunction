#> arena_dungeons:rewarding/chest/spawn
# モデル設置 & 設置アニメーション
$execute align xyz positioned ~0.5 ~ ~0.5 rotated ~ 0 run function animated_java:treasure_chest/summon/$(rarity)
execute as @e[tag=arena.dungeons.animated_java.treasure_chest,sort=nearest,limit=1] run function animated_java:treasure_chest/animations/spawn/play

# データセット
$data modify entity @e[tag=arena.dungeons.misc.treasure_chest_marker,sort=nearest,limit=1] data.arena.dungeons.treasure_chest.rarity set value "$(rarity)"

#
loot spawn ~ -63 ~ loot arena_dungeons:treasure_chest/normal

execute as @e[tag=arena.dungeons.misc.treasure_chest_marker,sort=nearest,limit=1] positioned ~ -63 ~ run data modify entity @s data.arena.dungeons.treasure_chest.contents set from entity @e[type=item,sort=nearest,limit=1] Item

execute positioned ~ -63 ~ run kill @e[type=item,sort=nearest,limit=1]

kill @s
