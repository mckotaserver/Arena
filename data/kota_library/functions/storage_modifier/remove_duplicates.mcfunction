## 配列から重複データ削除くん
# データ格納用マーカーを召喚
summon marker ~ ~ ~ {UUID:[I;0,0,0,0],Tags:[]}

# マーカーにinのデータを入れる; このとき重複は自動で削除される
data modify entity 0-0-0-0-0 Tags append from storage kota_library: remove_duplicates.in[]

# outに処理済データを出力
data modify storage kota_library: remove_duplicates.out set from entity 0-0-0-0-0 Tags

# マーカーをkill
kill 0-0-0-0-0
