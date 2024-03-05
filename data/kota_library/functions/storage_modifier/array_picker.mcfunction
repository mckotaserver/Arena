## 配列から抽出くん
# 出力値をリセット
data remove storage kota_library: array_picker.out

# in[($index)]のデータをoutに出力
$data modify storage kota_library: array_picker.out set from storage kota_library: array_picker.in[$(index)]

#> 各種設定

$execute if data storage kota_library: {array_picker:{option:{remove_index:true}}} run data remove storage kota_library: array_picker.in[$(index)]
