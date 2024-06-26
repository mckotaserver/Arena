## LOAD.
# スコアボード定義 
scoreboard objectives add arena.StageId dummy
scoreboard objectives add arena.temp dummy
scoreboard objectives add arena dummy

scoreboard objectives add arena.leave_game custom:leave_game
scoreboard objectives add arena.player_id dummy
scoreboard objectives add arena.timer dummy

scoreboard objectives add arena.trigger trigger ""

scoreboard objectives add Constant dummy

scoreboard players set #-1 Constant -1
scoreboard players set #2 Constant 2
scoreboard players set #5 Constant 5
scoreboard players set #10 Constant 10
scoreboard players set #20 Constant 20
scoreboard players set #60 Constant 60
scoreboard players set #100 Constant 100

#> ステージ情報の設定
# assets読み込み
function arena_normal:assets/stage_data/load
function arena_normal:assets/difficulty/load

# Marker
execute as @e[tag=arena.normal_stage.stage_core] unless data entity @s data.arena run data merge entity @s {data:{arena:{isEmpty:true,stage_data:{}}}}

execute unless data storage arena:records normal run data modify storage arena:records normal set value [{name:"エンドレス",data:[]},{name:"ゾンビ",data:[]},{name:"スケルトン",data:[]},{name:"ブレイズ",data:[]},{name:"スパイダー",data:[]},{name:"スライム",data:[]},{name:"クリーパー",data:[]}]

# team
team add arena.Mobs
team modify arena.Mobs friendlyFire false
