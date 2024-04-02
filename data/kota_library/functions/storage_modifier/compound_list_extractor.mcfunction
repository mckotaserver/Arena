## Compound Listからデータ抽出
# マクロ代入
data modify storage kota_library: compound_list_extractor.out set value {}
$data modify storage kota_library: compound_list_extractor.out append from storage kota_library: compound_list_extractor.in[{$(key):$(value)}]


