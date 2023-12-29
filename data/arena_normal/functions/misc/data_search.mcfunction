## MobTypeからデータ探索
# out をリセット
data modify storage arena:temp MatchingStageData set value {}

# assetsからimport
$data modify storage arena:temp MatchingStageData set from storage arena:assets stage_data[$(MobType)]
