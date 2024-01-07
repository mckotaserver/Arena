## クエスト登録
# 項の作成
data modify storage arena:assets utility.quests append value {}

#> クエストデータ
# 要件: requirement 
data modify storage arena:assets utility.quests[-1].requirement set value {}
    data modify storage arena:assets utility.quests[-1].requirement.type set value "completion"
    data modify storage arena:assets utility.quests[-1].requirement.mob_type set value 0
    data modify storage arena:assets utility.quests[-1].requirement.count set value 10
    data modify storage arena:assets utility.quests[-1].requirement.difficulty set value difficulty

# 種類: daily/weekly
data modify storage arena:assets utility.quests[-1].type set value "daily"

# reward_point
data modify storage arena:assets utility.quests[-1].reward_point set value 6
