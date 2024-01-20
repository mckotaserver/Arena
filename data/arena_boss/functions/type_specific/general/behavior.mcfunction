## 基本行動
#> 行動選択
    # 条件用: 体力割合取得
    execute store result score #Boss.ActionSelection.HealthLeft Arena.Temp run data get entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.EntityData.Health 100
    execute store result score #Boss.ActionSelection.HealthMax Arena.Temp run data get entity @e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1] data.Arena.Boss.StageData.EntityData.Health

    scoreboard players operation #Boss.ActionSelection.HealthLeft Arena.Temp /= #Boss.ActionSelection.HealthMax Arena.Temp

    # 条件用: 乱数生成
    execute store result score #Boss.ActionSelection.Random Arena.Temp run random value 0..99

    # 分岐処理
    $function arena_boss:type_specific/$(Directory)/behavior/_
