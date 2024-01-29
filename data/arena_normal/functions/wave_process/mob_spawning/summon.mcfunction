## 実召喚処理
# 偏角だけずらして召喚
$execute positioned ^ ^ ^6 rotated $(rotation) 0 run summon $(mob_id) ^ ^-0.5 ^$(distance) $(mob_nbt)

# パーティクル
$execute positioned ^ ^ ^6 rotated $(rotation) 0 run particle minecraft:effect ^ ^-0.5 ^$(distance) 0 0 0 0.25 10
