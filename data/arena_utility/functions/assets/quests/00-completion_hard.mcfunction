## クエスト登録
# 項の作成
data modify storage arena:assets utility.quests append value {}

#> クエストデータ
# 要件: requirement 
data modify storage arena:assets utility.quests[-1].requirement set value {}
    data modify storage arena:assets utility.quests[-1].requirement.type set value "completion"
    data modify storage arena:assets utility.quests[-1].requirement.mob_type set value 0
    data modify storage arena:assets utility.quests[-1].requirement.count set value 10
    data modify storage arena:assets utility.quests[-1].requirement.difficulty set value 2

# 種類: daily/weekly
data modify storage arena:assets utility.quests[-1].type set value "daily"

# 進捗表示
data modify storage arena:assets utility.quests[-1].progress_bar set value true

# 報酬
data modify storage arena:assets utility.quests[-1].reward set value {}
    data modify storage arena:assets utility.quests[-1].reward.point set value 6
    data modify storage arena:assets utility.quests[-1].reward.item set value {id:"minecraft:diamond",Count:2b}

