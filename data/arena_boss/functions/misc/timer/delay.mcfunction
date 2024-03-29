## 終了 遅延
# 現在の時刻を取得
execute at @e[tag=arena.boss.stage_core] store result score #CurrentTick arena.temp run time query gametime

# すべてのcoreの終了予定時刻を設定
execute as @e[tag=arena.boss.stage_core] store result score @s arena.temp run data get entity @s data.arena.Timer.EndTick

# 終了予定時刻と現在時刻が等しければ処理実行 → 
    # このとき遅延により正しく判定されない場合があるので、±10tick幅を広げておく
    scoreboard players operation #CurrentTick arena.temp /= #20 Constant
    scoreboard players operation #CurrentTick arena.temp *= #20 Constant

    scoreboard players operation #CurrentTick-Max arena.temp = #CurrentTick arena.temp
    scoreboard players add #CurrentTick-Max arena.temp 19

execute as @e[tag=arena.boss.stage_core] if score #CurrentTick arena.temp <= @s arena.temp if score @s arena.temp <= #CurrentTick-Max arena.temp at @s run function arena_boss:misc/timer/macro_assignment with entity @s data.arena.Timer

