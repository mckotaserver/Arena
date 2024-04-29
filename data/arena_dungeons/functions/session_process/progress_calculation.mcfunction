#> arena_dungeons:session_process/progress_calculation
scoreboard players set #dungeons.floor_progress.result arena.temp 0

# 目ごとに計算
    # スポナー
    execute store result score #dungeons.floor_progress.spawner arena.temp if entity @e[tag=arena.dungeons.mobs.spawner.core]
    scoreboard players operation #dungeons.floor_progress.spawner arena.temp *= #15 Constant

    scoreboard players operation #dungeons.floor_progress.result arena.temp += #dungeons.floor_progress.spawner arena.temp

    # モブ
    execute store result score #dungeons.floor_progress.mobs arena.temp if entity @e[tag=arena.dungeons.mobs.main]
    scoreboard players operation #dungeons.floor_progress.mobs arena.temp *= #2 Constant

    scoreboard players operation #dungeons.floor_progress.result arena.temp += #dungeons.floor_progress.mobs arena.temp

    # チェスト
    execute store result score #dungeons.floor_progress.treasure_chest arena.temp if entity @e[tag=arena.dungeons.misc.treasure_chest_spawner]
    scoreboard players operation #dungeons.floor_progress.treasure_chest arena.temp *= #20 Constant
    
    scoreboard players operation #dungeons.floor_progress.result arena.temp += #dungeons.floor_progress.treasure_chest arena.temp



