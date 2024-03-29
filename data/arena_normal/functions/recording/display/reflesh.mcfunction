## ディスプレイ表示データの更新
# 参照元のデータをコピー
$data modify storage arena_normal:temp display.specified set from storage arena:records normal[{name:"$(name)"}].data
$execute unless data storage arena:records normal[{name:"$(name)"}] run data modify storage arena_normal:temp display.specified set value []

# ranker 
data modify storage arena_normal:temp display.marco.ranker_1st set value ""
data modify storage arena_normal:temp display.marco.ranker_2nd set value ""
data modify storage arena_normal:temp display.marco.ranker_3rd set value ""
data modify storage arena_normal:temp display.marco.ranker_4th set value ""
data modify storage arena_normal:temp display.marco.ranker_5th set value ""

data modify storage arena_normal:temp display.marco.ranker_1st set from storage arena_normal:temp display.specified[0].Name
data modify storage arena_normal:temp display.marco.ranker_2nd set from storage arena_normal:temp display.specified[1].Name
data modify storage arena_normal:temp display.marco.ranker_3rd set from storage arena_normal:temp display.specified[2].Name
data modify storage arena_normal:temp display.marco.ranker_4th set from storage arena_normal:temp display.specified[3].Name
data modify storage arena_normal:temp display.marco.ranker_5th set from storage arena_normal:temp display.specified[4].Name

# record
data modify storage arena_normal:temp display.marco.record_1st set value ""
data modify storage arena_normal:temp display.marco.record_2nd set value ""
data modify storage arena_normal:temp display.marco.record_3rd set value ""
data modify storage arena_normal:temp display.marco.record_4th set value ""
data modify storage arena_normal:temp display.marco.record_5th set value ""

data modify storage arena_normal:temp display.marco.record_1st set from storage arena_normal:temp display.specified[0].display_data
data modify storage arena_normal:temp display.marco.record_2nd set from storage arena_normal:temp display.specified[1].display_data
data modify storage arena_normal:temp display.marco.record_3rd set from storage arena_normal:temp display.specified[2].display_data
data modify storage arena_normal:temp display.marco.record_4th set from storage arena_normal:temp display.specified[3].display_data
data modify storage arena_normal:temp display.marco.record_5th set from storage arena_normal:temp display.specified[4].display_data

# Mob Name
$data modify storage arena_normal:temp display.marco.Name set value "$(name)"

# マクロ実行
function arena_normal:recording/display/assign with storage arena_normal:temp display.marco

