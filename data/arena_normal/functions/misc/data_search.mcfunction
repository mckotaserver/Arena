## mob_typeからデータ探索
# out をリセット
data modify storage arena_normal:temp stage_data_searching.out set value {}

# assetsからimport
$data modify storage arena_normal:temp stage_data_searching.out set from storage arena:assets stage_data[$(mob_type)]
