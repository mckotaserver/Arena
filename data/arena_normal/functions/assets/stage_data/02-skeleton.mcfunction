## 02-skeleton のステージ情報設定
# 項の作成
data modify storage arena:assets stage_data append value {id:"02-skeleton"}

#> 召喚データ
# Mob ID
data modify storage arena:assets stage_data[-1].mob_data set value [{"id":"minecraft:skeleton","weight":2,Multiplier:1.00},{"id":"minecraft:skeleton","weight":1,"data":{HandItem:[{id:"minecraft:iron_axe"},{}]},Multiplier:1.15}]

# ウェーブごと召喚数: summon_count
data modify storage arena:assets stage_data[-1].summon_count set value [12, 16, 20, 24, 28]

# 体力値: health
data modify storage arena:assets stage_data[-1].health set value [16.0f, 20.0f, 24.0f, 28.0f, 30.0f]

# 攻撃力: strength
data modify storage arena:assets stage_data[-1].strength set value [2.0f, 2.5f, 3.0f, 3.5f, 4.0f]

# 移動速度: speed
data modify storage arena:assets stage_data[-1].speed set value [0.16f, 0.17f, 0.18f, 0.19f, 0.20f]

#> モブ固有データ
# 爆発力: explosion_radius
# data modify storage arena:assets stage_data[-1].speed set value [3, 3, 4, 4, 5]

#> その他
# 報酬: reward
data modify storage arena:assets stage_data[-1].reward set value [1, 3, 5]

# 入場可能人数
data modify storage arena:assets stage_data[-1].max_player set value 4

# 必要AP: required_ap
data modify storage arena:assets stage_data[-1].required_ap set value 2

# 名称: name
data modify storage arena:assets stage_data[-1].name set value '{"text":"スケルトン", "color":"#ddffff", "bold": true}'
