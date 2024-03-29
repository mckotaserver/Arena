## 報酬配布処理
# 順位 +1
    scoreboard players add #boss.DamageRanking.Rank arena.temp 1
    execute store result storage arena_boss:temp DamageRanking.Rank int 1 run scoreboard players get #boss.DamageRanking.Rank arena.temp

#> 配布数計算
    # 順位Rank → (BaseReward)/(Rank)
    execute store result score #boss.RewardCount-0 arena.temp run data get entity @e[tag=arena.boss.stage_core,sort=nearest,limit=1] data.arena.boss.StageData.BaseReward

    scoreboard players operation #boss.RewardCount-0 arena.temp /= #boss.DamageRanking.Rank arena.temp

    # 入場人数 → (BaseReward)/(player_count)/2
    execute store result score #boss.RewardCount-1 arena.temp run data get entity @e[tag=arena.boss.stage_core,sort=nearest,limit=1] data.arena.boss.StageData.BaseReward
    execute store result score #boss.player_count arena.temp run data get entity @e[tag=arena.boss.stage_core,sort=nearest,limit=1] data.arena.StageData.player_count

    scoreboard players operation #boss.RewardCount-1 arena.temp /= #boss.player_count arena.temp

    # 加算
    scoreboard players set #boss.RewardCount arena.temp 0

    scoreboard players operation #boss.RewardCount arena.temp += #boss.RewardCount-0 arena.temp
    scoreboard players operation #boss.RewardCount arena.temp += #boss.RewardCount-1 arena.temp

    # チケット枚数
    scoreboard players operation #Reward.TicketCount arena.temp = #boss.RewardCount arena.temp

#> ちょっと違うけど与ダメージランキングもここで 引き継ぐ人ごめん
    # 順位
        # 接尾辞設定
        execute if score #boss.DamageRanking.Rank arena.temp matches 1 run data modify storage arena_boss:temp DamageRanking.Suffix set value "st"
        execute if score #boss.DamageRanking.Rank arena.temp matches 2 run data modify storage arena_boss:temp DamageRanking.Suffix set value "nd"
        execute if score #boss.DamageRanking.Rank arena.temp matches 3.. run data modify storage arena_boss:temp DamageRanking.Suffix set value "rd"

        # 上2つを合成
        function arena_boss:type_specific/general/end/suffix_merging with storage arena_boss:temp DamageRanking

    # tellraw
    execute if score #boss.DamageRanking.Rank arena.temp matches 1 run tellraw @a[tag=arena.boss.player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-0","with":[{"nbt": "data.arena.boss.StageData.DisplayData.Name","entity": "@e[tag=arena.boss.stage_core,sort=nearest,limit=1]","interpret": true}]}]

    execute if score #boss.DamageRanking.Rank arena.temp matches 1..3 run tellraw @a[tag=arena.boss.player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-1","with":[{"storage": "arena_boss:temp","nbt": "DamageRanking.Merged","color":"gray"},{"selector":"@s","color": "yellow","bold": true},{"score":{"name": "@s","objective": "arenaboss.playerDealtDamage"},"color": "red"}]}]
    execute if score #boss.DamageRanking.Rank arena.temp matches 4.. run tellraw @a[tag=arena.boss.player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-1","with":[{"storage": "arena_boss:temp","nbt": "DamageRanking.Merged","color":"gray"},{"selector":"@s","color": "yellow","bold": false},{"score":{"name": "@s","objective": "arenaboss.playerDealtDamage"},"color": "red"}]}]

    execute if score #boss.DamageRanking.Rank arena.temp = #boss.player_count arena.temp run tellraw @a[tag=arena.boss.player,distance=..64] [{"translate":"kota-server.arena.boss.game.message.damage_ranking-2"}]

#> 配布
$loot spawn ~ ~ ~ loot $(LootTable)
loot spawn ~ ~ ~ loot arena_normal:ticket/hard

#> 再起処理
    # 一時タグ除去
    tag @s remove arena.temp-boss.RewardWaiting
    tag @s remove arena.temp-boss.RankingNext

    # ランキング 次のプレイヤーを取得 (tag=arena.temp-boss.RankingNext)
    scoreboard players operation #boss.DamageRanking.Next arena.temp > @a[tag=arena.boss.player,distance=..64] arenaboss.playerDealtDamage
    execute as @a[tag=arena.temp-boss.RewardWaiting] if score @s arenaboss.playerDealtDamage = #boss.DamageRanking.Next arena.temp run tag @s add arena.temp-boss.RankingNext

    # ほかにプレイヤーがいれば再起
    execute if entity @a[tag=arena.temp-boss.RewardWaiting] as @p[tag=arena.temp-boss.RankingNext] at @s run function arena_boss:type_specific/general/end/reward_give

