## 何かしら倒したとき →
# トリガー解除
advancement revoke @s only arena_normal:wave/mob_killed

# 付近にモブがいる = 全討伐していない なら処理中断
execute at @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] if entity @e[tag=Arena.Normal-Stage.Mob,distance=..48] run return -1

#> 特殊処理
    # 通常 → ステージの終了
    # 通常, Wave: 5, 残り召喚数0 → 終了処理へ
    execute as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] if data entity @s {data:{Arena:{Wave:5,Spawning:{Counter:0},StageData:{Type:"Normal"}}}}

    
    tellraw @a ["Wave:",{"nbt":"data.Arena.Wave","entity":"@e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1]"},",Counter:",{"nbt":"data.Arena.Spawning.Counter","entity":"@e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1]"},"Type:",{"nbt":"data.Arena.StageData.Type","entity":"@e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1]"}," at wave_process/mob_killed.mcf"]
    execute as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] if data entity @s {data:{Arena:{Wave:5,Spawning:{Counter:0},StageData:{Type:"Normal"}}}} at @s run function arena_normal:end/_
    execute as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] if data entity @s {data:{Arena:{Wave:5,Spawning:{Counter:0},StageData:{Type:"Normal"}}}} at @s run return -1

# 次ウェーブへの進行
execute at @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 1

# エンドレス → 報酬配布判定
execute store result score #Endless.Wave Arena.Temp run data get entity @s data.Arena.Wave
scoreboard players operation #Endless.Wave Arena.Temp %= #10 Constant

data modify storage arena:temp isBonus set value false
execute if data entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] {data:{Arena:{StageData:{Type:"Endless"}}}} if score #Endless.Wave Arena.Temp matches 0 run data modify storage arena:temp isBonus set value true

# 開始タイマー関連処理
    # 目標時刻を 300t 後に設定
    execute store result score #EndTick Arena.Temp run time query gametime
    scoreboard players add #EndTick Arena.Temp 300

        # エンドレス → 10Waveおき(チケット配布時)は休憩を倍に
        execute if data storage arena:temp {isBonus:true} run scoreboard players set #EndTick Arena.Temp 600

    # マーカーにデータ設定
    execute store result entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp

    # タイマー待機設定, カウント開始
    data modify entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.Timer.WaveWaiting set value true
    schedule function arena_normal:misc/wave_timer 1s

#> その他
# tellraw
execute at @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] if data storage arena:temp {isBonus:false} run tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.wave_announce.normal","with":[{"nbt":"data.Arena.Wave","entity":"@e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1]","color": "gold"}]}]

# エンドレス → 10Wave 毎 チケット配布等
execute if data storage arena:temp {isBonus:true} run function arena_normal:endless/reward

