## 基本行動
#> 行動選択
    # 条件用: 体力割合取得
    execute store result score #boss.ActionSelection.HealthLeft Arena.Temp run data get entity @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] data.Arena.boss.EntityData.Health 100
    execute store result score #boss.ActionSelection.HealthMax Arena.Temp run data get entity @e[tag=arena.boss.Stage-Core,sort=nearest,limit=1] data.Arena.boss.StageData.EntityData.Health

    scoreboard players operation #boss.ActionSelection.HealthLeft Arena.Temp /= #boss.ActionSelection.HealthMax Arena.Temp

    # 条件用: 乱数生成
    execute store result score #boss.ActionSelection.Random Arena.Temp run random value 0..99

    # 分岐処理
    $function arena_boss:type_specific/$(Directory)/behavior/_

    # 選択を保存
    execute as @e[tag=arena.boss.Main.Core,sort=nearest,limit=1] unless data entity @s {data:{Arena:{boss:{OperationData:{Animation:"regular"}}}}} run data modify entity @s data.Arena.boss.OperationData.LastAnimation set from entity @s data.Arena.boss.OperationData.Animation
