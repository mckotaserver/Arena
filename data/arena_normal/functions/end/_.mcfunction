## 終了処理
# プレイヤー通知
    # tellraw
    tellraw @a[tag=Arena.Normal-Stage.Player,distance=..48] [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.end_announce"}]

    # playsound
    execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 2
    execute as @a[tag=Arena.Normal-Stage.Player,distance=..48] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2

# 記録関連処理
    # クリア記録
    function arena_normal:recording/_

    data modify entity @s data.Arena.AnnounceDisplay.Record set from storage arena:temp Recording.Time.DisplayData
    execute if data entity @s {data:{Arena:{StageData:{Difficulty:2}}}} if data storage arena:temp {Recording:{Insertion:{ConditionMatched:true,Counter:0}}} run data modify entity @s data.Arena.isNewRecord set value true

    # 統計
    data modify storage arena:temp Stats.Difficulty set from entity @s data.Arena.StageData.Difficulty
    data modify storage arena:temp Stats.MobType set from entity @s data.Arena.StageData.MobType

        # ヘッド召喚前準備
        setblock ~ -64 ~ bedrock replace
        setblock ~ -64 ~ barrel replace

    execute as @r[tag=Arena.Normal-Stage.Player,distance=..48] at @s run function arena_normal:recording/stats/_
    tag @a[tag=Arena.Temp-StatsRegistered] remove Arena.Temp-StatsRegistered

        # ヘッド召喚後処理
        setblock ~ -64 ~ bedrock replace

# クリア判定を抑制
data modify entity @s data.Arena.Timer.WaveWaiting set value true

# 終了時tellrawへの設定用データ
    # MobName
    execute if data entity @s {data:{Arena:{StageData:{MobType:0}}}} run data modify entity @s data.Arena.AnnounceDisplay.MobName set value "entity.minecraft.zombie"
    execute if data entity @s {data:{Arena:{StageData:{MobType:1}}}} run data modify entity @s data.Arena.AnnounceDisplay.MobName set value "entity.minecraft.skeleton"
    execute if data entity @s {data:{Arena:{StageData:{MobType:2}}}} run data modify entity @s data.Arena.AnnounceDisplay.MobName set value "entity.minecraft.blaze"
    execute if data entity @s {data:{Arena:{StageData:{MobType:3}}}} run data modify entity @s data.Arena.AnnounceDisplay.MobName set value "entity.minecraft.spider"
    execute if data entity @s {data:{Arena:{StageData:{MobType:4}}}} run data modify entity @s data.Arena.AnnounceDisplay.MobName set value "entity.minecraft.slime"
    execute if data entity @s {data:{Arena:{StageData:{MobType:5}}}} run data modify entity @s data.Arena.AnnounceDisplay.MobName set value "entity.minecraft.creeper"
    execute if data entity @s {data:{Arena:{StageData:{MobType:6}}}} run data modify entity @s data.Arena.AnnounceDisplay.MobName set value "entity.minecraft.guardian"

    # Difficulty
    execute if data entity @s {data:{Arena:{StageData:{Difficulty:0}}}} run data modify entity @s data.Arena.AnnounceDisplay.Difficulty set value "kota-server.arena.game.difficulty.easy"
    execute if data entity @s {data:{Arena:{StageData:{Difficulty:1}}}} run data modify entity @s data.Arena.AnnounceDisplay.Difficulty set value "kota-server.arena.game.difficulty.normal"
    execute if data entity @s {data:{Arena:{StageData:{Difficulty:2}}}} run data modify entity @s data.Arena.AnnounceDisplay.Difficulty set value "kota-server.arena.game.difficulty.hard"

    execute if data entity @s {data:{Arena:{StageData:{Difficulty:0}}}} run data modify entity @s data.Arena.AnnounceDisplay.DifficultyColor set value "green"
    execute if data entity @s {data:{Arena:{StageData:{Difficulty:1}}}} run data modify entity @s data.Arena.AnnounceDisplay.DifficultyColor set value "yellow"
    execute if data entity @s {data:{Arena:{StageData:{Difficulty:2}}}} run data modify entity @s data.Arena.AnnounceDisplay.DifficultyColor set value "red"

# タイマー関連処理
execute store result score #EndTick Arena.Temp run time query gametime
scoreboard players add #EndTick Arena.Temp 300

execute store result entity @s data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp
schedule function arena_normal:end/delay 300t

# チケットの配布
execute if data entity @s {data:{Arena:{StageData:{Difficulty:0}}}} store result score #Reward.TicketCount Arena.Temp run data get entity @s data.Arena.Spawning.Detail.reward[0]
execute if data entity @s {data:{Arena:{StageData:{Difficulty:1}}}} store result score #Reward.TicketCount Arena.Temp run data get entity @s data.Arena.Spawning.Detail.reward[1]
execute if data entity @s {data:{Arena:{StageData:{Difficulty:2}}}} store result score #Reward.TicketCount Arena.Temp run data get entity @s data.Arena.Spawning.Detail.reward[2]
 
execute if data entity @s {data:{Arena:{StageData:{Difficulty:0}}}} as @a[tag=Arena.Normal-Stage.Player,distance=..48] run loot give @s loot arena_normal:ticket/easy
execute if data entity @s {data:{Arena:{StageData:{Difficulty:1}}}} as @a[tag=Arena.Normal-Stage.Player,distance=..48] run loot give @s loot arena_normal:ticket/normal
execute if data entity @s {data:{Arena:{StageData:{Difficulty:2}}}} as @a[tag=Arena.Normal-Stage.Player,distance=..48] run loot give @s loot arena_normal:ticket/hard



