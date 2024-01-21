## 終了 遅延
# 現在の時刻を取得
execute at @e[tag=Arena.Boss.Stage-Core] store result score #CurrentTick Arena.Temp run time query gametime

# すべてのcoreの終了予定時刻を設定
execute as @e[tag=Arena.Boss.Stage-Core] store result score @s Arena.Temp run data get entity @s data.Arena.Timer.EndTick

# 終了予定時刻と現在時刻が等しければ処理実行 → 
    # このとき遅延により正しく判定されない場合があるので、±10tick幅を広げておく
    scoreboard players operation #CurrentTick Arena.Temp /= #20 Constant
    scoreboard players operation #CurrentTick Arena.Temp *= #20 Constant

    scoreboard players operation #CurrentTick-Max Arena.Temp = #CurrentTick Arena.Temp
    scoreboard players add #CurrentTick-Max Arena.Temp 19

execute as @e[tag=Arena.Boss.Stage-Core] if score #CurrentTick Arena.Temp <= @s Arena.Temp if score @s Arena.Temp <= #CurrentTick-Max Arena.Temp at @s run function arena_boss:misc/timer/macro_assignment with entity @s data.Arena.Timer

