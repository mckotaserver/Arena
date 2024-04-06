## クエスト登録
# 項の作成
data modify storage arena:assets utility.quests append value {id:"solo_completion.12"}

#> クエストデータ
# 要件: requirement 
data modify storage arena:assets utility.quests[-1].requirement set value {}
    data modify storage arena:assets utility.quests[-1].requirement.type set value "solo_completion"
    data modify storage arena:assets utility.quests[-1].requirement.mob_type set value 1
    data modify storage arena:assets utility.quests[-1].requirement.count set value 5
    data modify storage arena:assets utility.quests[-1].requirement.difficulty set value 2
    data modify storage arena:assets utility.quests[-1].requirement.player_count set value 1
    data modify storage arena:assets utility.quests[-1].requirement.stage_type set value "normal"

# 種類: daily/weekly
data modify storage arena:assets utility.quests[-1].type set value "daily"

# 進捗計算の方法
data modify storage arena:assets utility.quests[-1].enable_progress set value true

# 難易度: easy/normal/hard
data modify storage arena:assets utility.quests[-1].difficulty set value "hard"

# 報酬
data modify storage arena:assets utility.quests[-1].reward set value {}
    data modify storage arena:assets utility.quests[-1].reward.point set value 8
    data modify storage arena:assets utility.quests[-1].reward.loot_table set value "arena_utility:quest_reward/tier_2"
    data modify storage arena:assets utility.quests[-1].reward.money set value {value:500,count:10}

