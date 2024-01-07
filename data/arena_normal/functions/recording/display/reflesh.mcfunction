## ディスプレイ表示データの更新
# 参照元のデータをコピー
$data modify storage arena:temp Display.Specified set from storage arena:records normal[{name:"$(name)"}].data
$execute unless data storage arena:records normal[{name:"$(name)"}] run data modify storage arena:temp Display.Specified set value []

# Ranker 
data modify storage arena:temp Display.Macro.Ranker_1st set value ""
data modify storage arena:temp Display.Macro.Ranker_2nd set value ""
data modify storage arena:temp Display.Macro.Ranker_3rd set value ""
data modify storage arena:temp Display.Macro.Ranker_4th set value ""
data modify storage arena:temp Display.Macro.Ranker_5th set value ""

data modify storage arena:temp Display.Macro.Ranker_1st set from storage arena:temp Display.Specified[0].Name
data modify storage arena:temp Display.Macro.Ranker_2nd set from storage arena:temp Display.Specified[1].Name
data modify storage arena:temp Display.Macro.Ranker_3rd set from storage arena:temp Display.Specified[2].Name
data modify storage arena:temp Display.Macro.Ranker_4th set from storage arena:temp Display.Specified[3].Name
data modify storage arena:temp Display.Macro.Ranker_5th set from storage arena:temp Display.Specified[4].Name

# Record
data modify storage arena:temp Display.Macro.Record_1st set value ""
data modify storage arena:temp Display.Macro.Record_2nd set value ""
data modify storage arena:temp Display.Macro.Record_3rd set value ""
data modify storage arena:temp Display.Macro.Record_4th set value ""
data modify storage arena:temp Display.Macro.Record_5th set value ""

data modify storage arena:temp Display.Macro.Record_1st set from storage arena:temp Display.Specified[0].DisplayData
data modify storage arena:temp Display.Macro.Record_2nd set from storage arena:temp Display.Specified[1].DisplayData
data modify storage arena:temp Display.Macro.Record_3rd set from storage arena:temp Display.Specified[2].DisplayData
data modify storage arena:temp Display.Macro.Record_4th set from storage arena:temp Display.Specified[3].DisplayData
data modify storage arena:temp Display.Macro.Record_5th set from storage arena:temp Display.Specified[4].DisplayData

# Mob Name
$data modify storage arena:temp Display.Macro.MobName set value "$(name)"

# マクロ実行
function arena_normal:recording/display/assign with storage arena:temp Display.Macro

