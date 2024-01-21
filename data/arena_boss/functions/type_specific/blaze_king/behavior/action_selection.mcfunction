## 行動選択
# "regular" でないなら中断
data modify storage arena_boss:temp Animations set from entity @e[tag=Arena.Boss.Main.Core,sort=nearest,limit=1] data.Arena.Boss.OperationData

execute unless data storage arena_boss:temp {Animations:{Animation:"regular"}} run return 0

# 特定条件 or 確率で選択
    # ミニオンがいない → "summon_minion"
    execute unless entity @e[tag=Arena.Boss.Main.Extra-02,distance=..64] unless data storage arena_boss:temp {Animations:{LastAnimation:"summon_minion"}} run function arena_boss:type_specific/blaze_king/animation/start {Animation:"summon_minion"}
    execute unless entity @e[tag=Arena.Boss.Main.Extra-02,distance=..64] unless data storage arena_boss:temp {Animations:{LastAnimation:"summon_minion"}} run return 0

    # 周囲にプレイヤーが10秒以上滞在している → "escape"
    execute if score @s Arena.Temp matches 200.. unless data storage arena_boss:temp {Animations:{LastAnimation:"escape"}} run function arena_boss:type_specific/blaze_king/animation/start {Animation:"escape"}
    execute if score @s Arena.Temp matches 200.. unless data storage arena_boss:temp {Animations:{LastAnimation:"escape"}} run return 0

    # 半径12m以内にプレイヤーがいない & 体力90%以下 → "implosion"
    execute unless entity @p[tag=Arena.Boss.Player,distance=..12] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..90 unless data storage arena_boss:temp {Animations:{LastAnimation:"implosion"}} run function arena_boss:type_specific/blaze_king/animation/start {Animation:"implosion"}
    execute unless entity @p[tag=Arena.Boss.Player,distance=..12] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..90 unless data storage arena_boss:temp {Animations:{LastAnimation:"implosion"}} run return 0

    # 半径8m以内にプレイヤーがいない & 体力75%以下 → "blazing_pillar"
    execute unless entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..75 unless data storage arena_boss:temp {Animations:{LastAnimation:"blazing_pillar"}} run function arena_boss:type_specific/blaze_king/animation/start {Animation:"blazing_pillar"}
    execute unless entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..75 unless data storage arena_boss:temp {Animations:{LastAnimation:"blazing_pillar"}} run return 0

    # ミニオンの半径6m以内にプレイヤーがいる & 体力80%以下 → "explode_minion"
    execute at @e[tag=Arena.Boss.Main.Extra-02,distance=..64] if entity @p[tag=Arena.Boss.Player,distance=..6] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..80 unless data storage arena_boss:temp {Animations:{LastAnimation:"explode_minion"}} run function arena_boss:type_specific/blaze_king/animation/start {Animation:"shot_hard"}
    execute at @e[tag=Arena.Boss.Main.Extra-02,distance=..64] if entity @p[tag=Arena.Boss.Player,distance=..6] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..80 unless data storage arena_boss:temp {Animations:{LastAnimation:"explode_minion"}} run return 0

    # 半径4-10mにプレイヤーがいる & 体力50%以下 → "radiative"
    execute if entity @p[tag=Arena.Boss.Player,distance=4..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..70 if score #Boss.ActionSelection.Random Arena.Temp matches 1..49 unless data storage arena_boss:temp {Animations:{LastAnimation:"radiative"}} run function arena_boss:type_specific/blaze_king/animation/start {Animation:"radiative"}
    execute if entity @p[tag=Arena.Boss.Player,distance=4..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..70 if score #Boss.ActionSelection.Random Arena.Temp matches 1..49 unless data storage arena_boss:temp {Animations:{LastAnimation:"radiative"}} run return 0

    # 半径7-10mにプレイヤーがいる & 体力50%以下 → "shot_round"
    execute if entity @p[tag=Arena.Boss.Player,distance=4..10] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..85 if score #Boss.ActionSelection.Random Arena.Temp matches 50..99 unless data storage arena_boss:temp {Animations:{LastAnimation:"shot_round"}} run function arena_boss:type_specific/blaze_king/animation/start {Animation:"shot_round"}
    execute if entity @p[tag=Arena.Boss.Player,distance=4..10] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..85 if score #Boss.ActionSelection.Random Arena.Temp matches 50..99 unless data storage arena_boss:temp {Animations:{LastAnimation:"shot_round"}} run return 0

    # 半径6mにプレイヤーがいる → "shot_simple"
    execute if entity @p[tag=Arena.Boss.Player,distance=..6] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches 67..99 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"shot_simple"}
    execute if entity @p[tag=Arena.Boss.Player,distance=..6] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches 67..99 run return 0

    # 半径8mにプレイヤーがいる & 体力41% - 66% → "shot_normal"
    execute if entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches 41..66 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"shot_normal"}
    execute if entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches 41..66 run return 0

    # # 半径8mにプレイヤーがいる & 体力40%以下 → "shot_hard"
    execute if entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..40 run function arena_boss:type_specific/blaze_king/animation/start {Animation:"shot_hard"}
    execute if entity @p[tag=Arena.Boss.Player,distance=..8] if score #Boss.ActionSelection.HealthLeft Arena.Temp matches ..40 run return 0
    