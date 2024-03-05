## 報酬配布処理
# 順位 +1
    scoreboard players add #Boss.DamageRanking.Rank Arena.Temp 1
    execute store result storage arena_boss:temp DamageRanking.Rank int 1 run scoreboard players get #Boss.DamageRanking.Rank Arena.Temp

#> 配布数計算
    # 順位Rank → (BaseReward)/(Rank)
    execute store result score #Boss.RewardCount-0 Arena.Temp run data get entity @e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1] data.Arena.Boss.StageData.BaseReward

    scoreboard players operation #Boss.RewardCount-0 Arena.Temp /= #Boss.DamageRanking.Rank Arena.Temp

    # 入場人数 → (BaseReward)/(player_count)/2
    execute store result score #Boss.RewardCount-1 Arena.Temp run data get entity @e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1] data.Arena.Boss.StageData.BaseReward
    execute store result score #Boss.player_count Arena.Temp run data get entity @e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1] data.Arena.StageData.player_count

    scoreboard players operation #Boss.RewardCount-1 Arena.Temp /= #Boss.player_count Arena.Temp

    # 加算
    scoreboard players set #Boss.RewardCount Arena.Temp 0

    scoreboard players operation #Boss.RewardCount Arena.Temp += #Boss.RewardCount-0 Arena.Temp
    scoreboard players operation #Boss.RewardCount Arena.Temp += #Boss.RewardCount-1 Arena.Temp

    # チケット枚数
    scoreboard players operation #Reward.TicketCount Arena.Temp = #Boss.RewardCount Arena.Temp

#> ちょっと違うけど与ダメージランキングもここで 引き継ぐ人ごめん
    # 順位
        # 接尾辞設定
        execute if score #Boss.DamageRanking.Rank Arena.Temp matches 1 run data modify storage arena_boss:temp DamageRanking.Suffix set value "st"
        execute if score #Boss.DamageRanking.Rank Arena.Temp matches 2 run data modify storage arena_boss:temp DamageRanking.Suffix set value "nd"
        execute if score #Boss.DamageRanking.Rank Arena.Temp matches 3.. run data modify storage arena_boss:temp DamageRanking.Suffix set value "rd"

        # 上2つを合成
        function arena_boss:type_specific/general/end/suffix_merging with storage arena_boss:temp DamageRanking

    # tellraw
    execute if score #Boss.DamageRanking.Rank Arena.Temp matches 1 run tellraw @a[tag=Arena.Boss.Player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-0","with":[{"nbt": "data.Arena.Boss.StageData.DisplayData.Name","entity": "@e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1]","interpret": true}]}]

    execute if score #Boss.DamageRanking.Rank Arena.Temp matches 1..3 run tellraw @a[tag=Arena.Boss.Player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-1","with":[{"storage": "arena_boss:temp","nbt": "DamageRanking.Merged","color":"gray"},{"selector":"@s","color": "yellow","bold": true},{"score":{"name": "@s","objective": "ArenaBoss.PlayerDealtDamage"},"color": "red"}]}]
    execute if score #Boss.DamageRanking.Rank Arena.Temp matches 4.. run tellraw @a[tag=Arena.Boss.Player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-1","with":[{"storage": "arena_boss:temp","nbt": "DamageRanking.Merged","color":"gray"},{"selector":"@s","color": "yellow","bold": false},{"score":{"name": "@s","objective": "ArenaBoss.PlayerDealtDamage"},"color": "red"}]}]

    execute if score #Boss.DamageRanking.Rank Arena.Temp = #Boss.player_count Arena.Temp run tellraw @a[tag=Arena.Boss.Player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-2"}]

#> 配布
$loot spawn ~ ~ ~ loot $(LootTable)
loot spawn ~ ~ ~ loot arena_normal:ticket/hard

#> 再起処理
    # 一時タグ除去
    tag @s remove Arena.Temp-Boss.RewardWaiting
    tag @s remove Arena.Temp-Boss.RankingNext

    # ランキング 次のプレイヤーを取得 (tag=Arena.Temp-Boss.RankingNext)
    scoreboard players operation #Boss.DamageRanking.Next Arena.Temp > @a[tag=Arena.Boss.Player,distance=..64] ArenaBoss.PlayerDealtDamage
    execute as @a[tag=Arena.Temp-Boss.RewardWaiting] if score @s ArenaBoss.PlayerDealtDamage = #Boss.DamageRanking.Next Arena.Temp run tag @s add Arena.Temp-Boss.RankingNext

    # ほかにプレイヤーがいれば再起
    execute if entity @a[tag=Arena.Temp-Boss.RewardWaiting] as @p[tag=Arena.Temp-Boss.RankingNext] at @s run function arena_boss:type_specific/general/end/reward_give

