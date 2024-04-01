## エンドレス: モブ抽選
# 乱数を生成, モブ数を取得
execute store result score #endless.mob_type arena.temp run random value 0..99
# tellraw awabi2048 ["1. ",{"score":{"name": "#endless.mob_type","objective": "arena.temp"}}]

execute store result score #endless.mob_type_all arena.temp run data get storage arena:assets stage_data

# 形だけエンドレスが入っているので削除
scoreboard players remove #endless.mob_type_all arena.temp 1

# tellraw awabi2048 ["2. ",{"score":{"name": "#endless.mob_type_all","objective": "arena.temp"}}]

# 種類で割り算
scoreboard players operation #endless.mob_type arena.temp %= #endless.mob_type_all arena.temp

# tellraw awabi2048 ["=> Result: ",{"score":{"name": "#endless.mob_type","objective": "arena.temp"}}]

# 召喚モブ種類に適用
execute store result entity @s data.arena.stage_data.mob_type int 1 run scoreboard players get #endless.mob_type arena.temp

# stage_detailを更新
data modify storage kota_library: array_picker.in set from storage arena:assets stage_data
data modify storage kota_library: array_picker.index set from entity @s data.arena.stage_data.mob_type
function kota_library:storage_modifier/array_picker with storage kota_library: array_picker

data modify entity @s data.arena.stage_detail set from storage kota_library: array_picker.out
