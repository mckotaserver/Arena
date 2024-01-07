## クエスト登録
# 項の作成
data modify storage arena:assets utility.quests append value {}

#> クエストデータ
# 要件: requirement 
data modify storage arena:assets utility.quests[-1].requirement set value {}
    data modify storage arena:assets utility.quests[-1].requirement.type set value "time_attack"
    data modify storage arena:assets utility.quests[-1].requirement.time_limit set value 3600
    data modify storage arena:assets utility.quests[-1].requirement.time_display set value "3:00"
    data modify storage arena:assets utility.quests[-1].requirement.mob_type set value 0
    data modify storage arena:assets utility.quests[-1].requirement.difficulty set value 2

# 種類: daily/weekly
data modify storage arena:assets utility.quests[-1].type set value "daily"

# reward_point
data modify storage arena:assets utility.quests[-1].reward_point set value 8
