## MobTypeからデータ探索
# out をリセット
data modify storage arena:temp stage_data_searching.out set value {}

# assetsからimport
$data modify storage arena:temp stage_data_searching.out set from storage arena:assets stage_data[$(MobType)]
