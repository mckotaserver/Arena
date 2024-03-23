## パーティクル ノーマル
# 煙
particle smoke ~ ~0.5 ~ 0.25 0.5 0.25 0.01 10

# 棒
execute at @e[tag=arena.boss.Main.Element-04,distance=..2] rotated ~45 ~ run particle dust_color_transition 1 0 0 1 0 0 0 ^ ^ ^1 0 0.2 0 1 0
execute at @e[tag=arena.boss.Main.Element-04,distance=..2] rotated ~135 ~ run particle dust_color_transition 1 0 0 1 0 0 0 ^ ^ ^1 0 0.2 0 1 0
execute at @e[tag=arena.boss.Main.Element-04,distance=..2] rotated ~225 ~ run particle dust_color_transition 1 0 0 1 0 0 0 ^ ^ ^1 0 0.2 0 1 0
execute at @e[tag=arena.boss.Main.Element-04,distance=..2] rotated ~315 ~ run particle dust_color_transition 1 0 0 1 0 0 0 ^ ^ ^1 0 0.2 0 1 0

# lava
particle falling_lava ~ ~ ~ 0.25 1 0.25 0 1
execute if predicate arena_utility:random_chance/1-04 run particle lava ~ ~1 ~ 0 0 0 0 1
