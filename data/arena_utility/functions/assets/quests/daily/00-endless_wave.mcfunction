## クエスト登録
# 項の作成
data modify storage arena:assets utility.quests append value {id:"00-endless_wave"}

#> クエストデータ
# 要件: requirement 
data modify storage arena:assets utility.quests[-1].requirement set value {}
    data modify storage arena:assets utility.quests[-1].requirement.type set value "endless_wave"
    data modify storage arena:assets utility.quests[-1].requirement.count set value 15
    data modify storage arena:assets utility.quests[-1].requirement.difficulty set value 2
    data modify storage arena:assets utility.quests[-1].requirement.count set value 1
    data modify storage arena:assets utility.quests[-1].requirement.stage_type set value "endless"

# 種類: daily/weekly
data modify storage arena:assets utility.quests[-1].type set value "daily"

# 進捗計算の方法
data modify storage arena:assets utility.quests[-1].enable_progress set value false

# 難易度: easy/normal/hard
data modify storage arena:assets utility.quests[-1].difficulty set value "hard"

# 報酬
data modify storage arena:assets utility.quests[-1].reward set value {}
    data modify storage arena:assets utility.quests[-1].reward.point set value 6
    data modify storage arena:assets utility.quests[-1].reward.loot_table set value "_"
    data modify storage arena:assets utility.quests[-1].reward.item set value [{id:"minecraft:diamond",Count:2b},{id:"minecraft:stone",Count:5b}]

