## 行動選択
# 特定条件 or 確率で選択
    # ミニオンがいない → "summon_minion"
    execute unless entity @e[tag=Arena.Boss.Main.Extra-02,distance=..64] run function arena_boss:type_specific/blaze_king/animation/start {Animation:"summon_minion"}
    execute unless entity @e[tag=Arena.Boss.Main.Extra-02,distance=..64] run return 0

    # 周囲にプレイヤーが10秒以上滞在している → "escape"
    execute if score @s Arena.Temp matches 200.. run function arena_boss:type_specific/blaze_king/animation/start {Animation:"escape"}
    execute if score @s Arena.Temp matches 200.. run return 0

    # 半径12m以内にプレイヤーがいない & 体力90%以下 → "implosion"
    execute unless entity @p[tag=Arena.Boss.Player,distance=..12] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..90 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"implosion"}
    execute unless entity @p[tag=Arena.Boss.Player,distance=..12] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..90 run return 0

    # # 半径8m以内にプレイヤーがいない & 体力60%以下 → "blazing_pillar"
    # execute unless entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..75 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"blazing_pillar"}
    # execute unless entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..75 run return 0

    # # ブレイズミニオンの半径3m以内にプレイヤーがいる & 体力80%以下 → "explode_minion"
    # execute at @e[tag=Arena.Boss.Main.Extra-02,type=blaze,distance=..64] if entity @p[tag=Arena.Boss.Player,distance=..3] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..80 if score #Boss.ActionSelection.Random Arena.Temp matches 0..75 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"shot_hard"}
    # execute at @e[tag=Arena.Boss.Main.Extra-02,type=blaze,distance=..64] if entity @p[tag=Arena.Boss.Player,distance=..3] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..80 if score #Boss.ActionSelection.Random Arena.Temp matches 0..75 run return 0

    # # 半径6-10mにプレイヤーがいる & 体力50%以下 & 乱数 0-75 → "shot_round"
    # execute if entity @p[tag=Arena.Boss.Player,distance=6..10] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..85 if score #Boss.ActionSelection.Random Arena.Temp matches 0..75 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"shot_round"}
    # execute if entity @p[tag=Arena.Boss.Player,distance=6..10] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..85 if score #Boss.ActionSelection.Random Arena.Temp matches 0..75 run return 0

    # # 半径6-10mにプレイヤーがいる & 体力50%以下 & 乱数 0-75 → "laser"
    # execute if entity @p[tag=Arena.Boss.Player,distance=6..10] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..70 if score #Boss.ActionSelection.Random Arena.Temp matches 0..75 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"laser"}
    # execute if entity @p[tag=Arena.Boss.Player,distance=6..10] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..70 if score #Boss.ActionSelection.Random Arena.Temp matches 0..75 run return 0

    # # 半径6mにプレイヤーがいる → "shot_simple"
    # execute if entity @p[tag=Arena.Boss.Player,distance=..6] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches 67..99 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"shot_simple"}
    # execute if entity @p[tag=Arena.Boss.Player,distance=..6] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches 67..99 run return 0

    # # 半径8mにプレイヤーがいる & 体力41% - 66% → "shot_normal"
    # execute if entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches 41..66 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"shot_normal"}
    # execute if entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches 41..66 run return 0

    # # 半径8mにプレイヤーがいる & 体力40%以下 → "shot_hard"
    # execute if entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..40 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"shot_hard"}
    # execute if entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..40 run return 0
    
    
