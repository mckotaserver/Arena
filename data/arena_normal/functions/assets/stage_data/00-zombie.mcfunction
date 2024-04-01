## 01-zombie のステージ情報設定
# 項の作成
data modify storage arena:assets stage_data append value {id:"00-zombie"}

#> 召喚データ
# Mob ID
data modify storage arena:assets stage_data[-1].mob_data set value []
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:zombie",weight:5,condition:{wave:{min:1},difficulty:{min:0,max:2}},multiplier:1.00}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:zombie",weight:3,condition:{wave:{min:1},difficulty:{min:0,max:2}},multiplier:0.80,data:{"IsBaby":true}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:zombie",weight:2,condition:{wave:{min:3},difficulty:{min:1,max:2}},multiplier:1.20,data:{ArmorItems:[{},{},{},{id:"minecraft:leather_helmet",Count:1b}],HandItems:[{id:"minecraft:wooden_sword",Count:1b},{}],ArmorDropChances:[-1E40f,-1E40f,-1E40f,-1E40f],HandDropChances:[-1E40f,-1E40f]}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:zombie",weight:1,condition:{wave:{min:4},difficulty:{min:2,max:2}},multiplier:1.30,data:{ArmorItems:[{},{},{},{id:"minecraft:diamond_helmet",Count:1b}],HandItems:[{id:"minecraft:golden_hoe",Count:1b},{}],ArmorDropChances:[-1E40f,-1E40f,-1E40f,-1E40f],HandDropChances:[-1E40f,-1E40f],Attributes:[{Name:"minecraft:generic.attack_damage",Modifiers:[{Amount:6,Operation:0,UUID:[I;0,0,0,1]}]},{Name:"minecraft:generic.movement_speed",Modifiers:[{Amount:0.1,Operation:0,UUID:[I;0,0,0,2]}]}]}}

# ウェーブごと召喚数: summon_count
data modify storage arena:assets stage_data[-1].summon_count set value [12, 16, 20, 24, 28]

# 体力値: health
data modify storage arena:assets stage_data[-1].health set value [20.0f, 25.0f, 30.0f, 35.0f, 40.0f]

# 攻撃力: strength
data modify storage arena:assets stage_data[-1].strength set value [3.0f, 3.5f, 4.0f, 4.5f, 5.0f]

# 移動速度: speed
data modify storage arena:assets stage_data[-1].speed set value [0.22f, 0.23f, 0.24f, 0.25f, 0.26f]

#> その他ステージ情報
# 報酬: reward
data modify storage arena:assets stage_data[-1].reward set value [3, 3, 3]

# 入場可能人数
data modify storage arena:assets stage_data[-1].max_player set value 4

# 必要AP: required_ap
data modify storage arena:assets stage_data[-1].required_ap set value 1

# 名称: name
data modify storage arena:assets stage_data[-1].name set value "ゾンビ"

# 翻訳キー: translation key
data modify storage arena:assets stage_data[-1].display.translation_key set value "entity.minecraft.zombie"
