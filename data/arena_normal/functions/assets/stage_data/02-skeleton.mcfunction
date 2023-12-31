## 02-skeleton のステージ情報設定
# 項の作成
data modify storage arena:assets stage_data append value {id:"02-skeleton"}

#> 召喚データ
# Mob ID
data modify storage arena:assets stage_data[-1].mob_data set value []
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:skeleton",weight:3,Multiplier:1.00,data:{HandItems:[{id:"minecraft:bow",Count:1b},{}]}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:skeleton",weight:1,Multiplier:1.20,data:{ArmorItems:[{id:"minecraft:chainmail_boots",Count:1b},{},{},{}],HandItems:[{id:"minecraft:iron_axe",Count:1b},{}],Attributes:[{Name:"minecraft:generic.movement_speed",Modifiers:[{Amount:-0.15,Operation:2,UUID:[I;0,0,0,0]}]}]}}

# ウェーブごと召喚数: summon_count
data modify storage arena:assets stage_data[-1].summon_count set value [15, 18, 21, 25, 30]

# 体力値: health
data modify storage arena:assets stage_data[-1].health set value [20.0f, 25.0f, 30.0f, 35.0f, 40.0f]

# 攻撃力: strength
data modify storage arena:assets stage_data[-1].strength set value [3.0f, 3.5f, 4.0f, 4.5f, 5.0f]

# 移動速度: speed
data modify storage arena:assets stage_data[-1].speed set value [0.25f, 0.26f, 0.27f, 0.28f, 0.29f]

#> モブ固有データ
# 爆発力: explosion_radius
# data modify storage arena:assets stage_data[-1].speed set value [3, 3, 4, 4, 5]

#> その他ステージ情報
# 報酬: reward
data modify storage arena:assets stage_data[-1].reward set value [2, 3, 4]

# 入場可能人数
data modify storage arena:assets stage_data[-1].max_player set value 4

# 必要AP: required_ap
data modify storage arena:assets stage_data[-1].required_ap set value 2

# 名称: name
data modify storage arena:assets stage_data[-1].name set value "スケルトン"
