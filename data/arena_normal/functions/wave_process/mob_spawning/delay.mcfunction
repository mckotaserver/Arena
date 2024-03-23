## 遅延処理用
# 各終了予定時刻を取得
execute as @e[tag=arena.normal-stage.Stage-Core] store result score @s Arena.Temp run data get entity @s data.Arena.Timer.EndTick

# 現在時刻を取得
execute store result score #CurrentTick Arena.Temp at @e[tag=arena.normal-stage.Stage-Core,sort=random,limit=1] run time query gametime 

# 終了予定時刻と現在時刻が等しければ処理実行 → 
    # このとき遅延により正しく判定されない場合があるので、±10tick幅を広げておく
    scoreboard players operation #CurrentTick Arena.Temp /= #20 Constant
    scoreboard players operation #CurrentTick Arena.Temp *= #20 Constant

    scoreboard players operation #CurrentTick-Max Arena.Temp = #CurrentTick Arena.Temp
    scoreboard players add #CurrentTick-Max Arena.Temp 19

# 終了予定時刻と現在時刻が等しければ処理実行
execute as @e[tag=arena.normal-stage.Stage-Core] if score #CurrentTick Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick-Max Arena.Temp at @s as @e[tag=arena.normal-stage.SpawnMarker,sort=random,limit=1,distance=..48,tag=!Arena.Temp-RecentSpawnedPos] at @s run function arena_normal:wave_process/mob_spawning/_
execute as @e[tag=arena.normal-stage.Stage-Core] if score #CurrentTick Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick-Max Arena.Temp at @s as @e[tag=arena.Temp-RecentSpawnedPos,distance=..48] run tag @s remove Arena.Temp-RecentSpawnedPos


