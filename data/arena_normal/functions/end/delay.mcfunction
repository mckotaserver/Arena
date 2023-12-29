## 終了 遅延
execute store result score #EndTick Arena.Temp run time query gametime
execute as @e[tag=Arena.Normal-Stage.Stage-Core] store result score @s Arena.Temp run data get entity @s data.Arena.Timer.EndTick

execute as @e[tag=Arena.Normal-Stage.Stage-Core] if score @s Arena.Temp = #EndTick Arena.Temp at @s run function arena_normal:end/main

