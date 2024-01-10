## クエスト登録
# 項の作成
data modify storage arena:assets utility.quests append value {}

#> クエストデータ
# 要件: requirement 
data modify storage arena:assets utility.quests[-1].requirement set value {}
    data modify storage arena:assets utility.quests[-1].requirement.type set value "count_completion"
    data modify storage arena:assets utility.quests[-1].requirement.count set value 15
    data modify storage arena:assets utility.quests[-1].requirement.difficulty set value 2

# 種類: daily/weekly
data modify storage arena:assets utility.quests[-1].type set value "daily"

# 進捗表示
data modify storage arena:assets utility.quests[-1].progress_bar set value true

# reward.point
data modify storage arena:assets utility.quests[-1].reward.point set value 8
