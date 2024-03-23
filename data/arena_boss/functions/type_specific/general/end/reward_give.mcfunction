## 報酬配布処理
# 順位 +1
    scoreboard players add #boss.DamageRanking.Rank Arena.Temp 1
    execute store result storage arena_boss:temp DamageRanking.Rank int 1 run scoreboard players get #boss.DamageRanking.Rank Arena.Temp

#> 配布数計算
    # 順位Rank → (BaseReward)/(Rank)
    execute store result score #boss.RewardCount-0 Arena.Temp run data get entity @e[tag=arena.boss.Stage-Core,sort=nearest,limit=1] data.Arena.boss.StageData.BaseReward

    scoreboard players operation #boss.RewardCount-0 Arena.Temp /= #boss.DamageRanking.Rank Arena.Temp

    # 入場人数 → (BaseReward)/(player_count)/2
    execute store result score #boss.RewardCount-1 Arena.Temp run data get entity @e[tag=arena.boss.Stage-Core,sort=nearest,limit=1] data.Arena.boss.StageData.BaseReward
    execute store result score #boss.player_count Arena.Temp run data get entity @e[tag=arena.boss.Stage-Core,sort=nearest,limit=1] data.Arena.StageData.player_count

    scoreboard players operation #boss.RewardCount-1 Arena.Temp /= #boss.player_count Arena.Temp

    # 加算
    scoreboard players set #boss.RewardCount Arena.Temp 0

    scoreboard players operation #boss.RewardCount Arena.Temp += #boss.RewardCount-0 Arena.Temp
    scoreboard players operation #boss.RewardCount Arena.Temp += #boss.RewardCount-1 Arena.Temp

    # チケット枚数
    scoreboard players operation #Reward.TicketCount Arena.Temp = #boss.RewardCount Arena.Temp

#> ちょっと違うけど与ダメージランキングもここで 引き継ぐ人ごめん
    # 順位
        # 接尾辞設定
        execute if score #boss.DamageRanking.Rank Arena.Temp matches 1 run data modify storage arena_boss:temp DamageRanking.Suffix set value "st"
        execute if score #boss.DamageRanking.Rank Arena.Temp matches 2 run data modify storage arena_boss:temp DamageRanking.Suffix set value "nd"
        execute if score #boss.DamageRanking.Rank Arena.Temp matches 3.. run data modify storage arena_boss:temp DamageRanking.Suffix set value "rd"

        # 上2つを合成
        function arena_boss:type_specific/general/end/suffix_merging with storage arena_boss:temp DamageRanking

    # tellraw
    execute if score #boss.DamageRanking.Rank Arena.Temp matches 1 run tellraw @a[tag=arena.boss.Player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-0","with":[{"nbt": "data.Arena.boss.StageData.DisplayData.Name","entity": "@e[tag=arena.boss.Stage-Core,sort=nearest,limit=1]","interpret": true}]}]

    execute if score #boss.DamageRanking.Rank Arena.Temp matches 1..3 run tellraw @a[tag=arena.boss.Player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-1","with":[{"storage": "arena_boss:temp","nbt": "DamageRanking.Merged","color":"gray"},{"selector":"@s","color": "yellow","bold": true},{"score":{"name": "@s","objective": "Arenaboss.PlayerDealtDamage"},"color": "red"}]}]
    execute if score #boss.DamageRanking.Rank Arena.Temp matches 4.. run tellraw @a[tag=arena.boss.Player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-1","with":[{"storage": "arena_boss:temp","nbt": "DamageRanking.Merged","color":"gray"},{"selector":"@s","color": "yellow","bold": false},{"score":{"name": "@s","objective": "Arenaboss.PlayerDealtDamage"},"color": "red"}]}]

    execute if score #boss.DamageRanking.Rank Arena.Temp = #boss.player_count Arena.Temp run tellraw @a[tag=arena.boss.Player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-2"}]

#> 配布
$loot spawn ~ ~ ~ loot $(LootTable)
loot spawn ~ ~ ~ loot arena_normal:ticket/hard

#> 再起処理
    # 一時タグ除去
    tag @s remove Arena.Temp-boss.RewardWaiting
    tag @s remove Arena.Temp-boss.RankingNext

    # ランキング 次のプレイヤーを取得 (tag=arena.Temp-boss.RankingNext)
    scoreboard players operation #boss.DamageRanking.Next Arena.Temp > @a[tag=arena.boss.Player,distance=..64] Arenaboss.PlayerDealtDamage
    execute as @a[tag=arena.Temp-boss.RewardWaiting] if score @s Arenaboss.PlayerDealtDamage = #boss.DamageRanking.Next Arena.Temp run tag @s add Arena.Temp-boss.RankingNext

    # ほかにプレイヤーがいれば再起
    execute if entity @a[tag=arena.Temp-boss.RewardWaiting] as @p[tag=arena.Temp-boss.RankingNext] at @s run function arena_boss:type_specific/general/end/reward_give

