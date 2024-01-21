## 報酬配布処理

say reward_give
$loot spawn ~ ~ ~ loot $(LootTable)

#> 再起処理
    # 一時タグ除去
    tag @s remove Arena.Temp-Boss.RewardWaiting

    # ほかにプレイヤーがいれば再起
    execute if entity @a[tag=Arena.Temp-Boss.RewardWaiting] as @r[tag=Arena.Temp-Boss.RewardWaiting] run function arena_boss:type_specific/general/end/reward_give
