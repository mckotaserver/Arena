## 〚入場〛ボタン押下
# トリガー解除
advancement revoke @s only arena_normal:stage_selector/on_click/confirm/left
advancement revoke @s only arena_normal:stage_selector/on_click/confirm/right

# sound
playsound ui.button.click master @s ~ ~ ~ 1 2

#> 入場可否
# データを取得 / 必要APを取得
function arena_normal:misc/data_search with entity @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] data.Arena.SelectorPage
execute store result score #APRequired Arena.Temp run data get storage arena:temp MatchingStageData.data.required_ap

# 比較
data modify storage arena:temp StageJoinable set value true
execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] if score #APRequired Arena.Temp > @s arena run data modify storage arena:temp StageJoinable set value false

# 入場判定 → 不可なら警告して処理中止
execute if data storage arena:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.not_enough_arena_point"}]
execute if data storage arena:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

execute if data storage arena:temp {StageJoinable:false} run return -1

# 入場判定: 空きステージがあるか判定
execute as @e[tag=Arena.Normal-Stage.Stage-Core] at @s unless entity @a[tag=Arena.Normal-Stage.Player,distance=..48] run tag @s add Arena.Temp-EmptyStage

execute unless entity @e[tag=Arena.Temp-EmptyStage] run data modify storage arena:temp StageJoinable set value false

tag @e[tag=Arena.Temp-EmptyStage] remove Arena.Temp-EmptyStage

# 入場判定 → 不可なら警告して処理中止
execute if data storage arena:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.error.no_available_stage"}]
execute if data storage arena:temp {StageJoinable:false} at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

execute if data storage arena:temp {StageJoinable:false} run return -1

# 入場判定 → 可なら減算
execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] run scoreboard players operation @s arena -= #APRequired Arena.Temp

#> 入場処理など
# 範囲内のプレイヤーをタグ付け
execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tag @a[distance=..4] add Arena.Normal-Stage.Player

# 入場可能ステージを選定・・ の前に使われてないステージがあったらリセット
execute as @e[tag=Arena.Normal-Stage.Stage-Core] if data entity @s {data:{Arena:{isEmpty:false}}} at @s unless entity @a[tag=Arena.Normal-Stage.Player,distance=..48] run function arena_normal:misc/stage_reset

# 入場可能ステージを選定
execute as @e[tag=Arena.Normal-Stage.Stage-Core] if data entity @s {data:{Arena:{isEmpty:true}}} run tag @s add Arena.Temp.EmptyStage
tag @e[tag=Arena.Temp.EmptyStage,sort=nearest,limit=1] add Arena.Temp.StageSelected

tag @e[tag=Arena.Temp.EmptyStage] remove Arena.Temp.EmptyStage

# isEmpty → false
data modify entity @e[tag=Arena.Temp.StageSelected,limit=1] data.Arena.isEmpty set value false

# 開始タイマー関連処理
execute store result score #EndTick Arena.Temp run time query gametime
scoreboard players add #EndTick Arena.Temp 300

execute store result entity @e[tag=Arena.Temp.StageSelected,limit=1] data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp

data modify entity @e[tag=Arena.Temp.StageSelected,limit=1] data.Arena.Timer.WaveWaiting set value true
schedule function arena_normal:misc/wave_timer 1s

# プレイヤー TP
execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..4] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_first","with":[{"text": "15","color": "yellow"}]}]

execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] at @e[tag=Arena.Temp.StageSelected] run tag @a[distance=..4] add Arena.Normal-Stage.Player
execute at @e[tag=Arena.Normal-Stage.Entrance,sort=nearest,limit=1] as @a[distance=..4] at @e[tag=Arena.Temp.StageSelected] run tp @s ~ ~-0.25 ~ ~ ~

# データを移動
data modify entity @e[tag=Arena.Temp.StageSelected,limit=1] data.Arena.StageData set from entity @e[tag=Arena.Normal-Stage.Selector-Core,sort=nearest,limit=1] data.Arena.SelectorPage

# ストラクチャーのロード
execute at @e[tag=Arena.Temp.StageSelected,limit=1] run place template arena_normal:stage/normal ~-34 ~-4 ~-34

#> 後処理
# 一時タグを処理
tag @e[tag=Arena.Temp.StageSelected] remove Arena.Temp.StageSelected

