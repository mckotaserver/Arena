## 02-skeleton のステージ情報設定
# 項の作成
data modify storage arena:assets stage_data append value {id:"01-skeleton"}

#> 召喚データ
# Mob ID
data modify storage arena:assets stage_data[-1].mob_data set value []
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:skeleton",weight:6,multiplier:1.00,condition:{wave:{min:1},difficulty:{min:0,max:2}},data:{HandItems:[{id:"minecraft:bow",Count:1b},{}],ArmorDropChances:[-1E40f,-1E40f,-1E40f,-1E40f],HandDropChances:[-1E40f,-1E40f]}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:skeleton",weight:2,multiplier:1.2,condition:{wave:{min:2},difficulty:{min:0,max:2}},data:{ArmorItems:[{id:"minecraft:chainmail_boots",Count:1b},{},{},{}],HandItems:[{id:"minecraft:stone_axe",Count:1b},{}],Attributes:[{Name:"minecraft:generic.movement_speed",Modifiers:[{Amount:-0.2,Operation:2,UUID:[I;0,0,0,0]}]},{Name:"minecraft:generic.attack_damage",Modifiers:[{Amount:-0.3,Operation:2,UUID:[I;0,0,0,1]}]}]}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:stray",weight:1,multiplier:0.60,condition:{wave:{min:3},difficulty:{min:1,max:2}},data:{ArmorItems:[{id:"minecraft:diamond_boots",Count:1b},{},{},{id:"minecraft:diamond_helmet",Count:1b}],ArmorDropChances:[-1E40f,-1E40f,-1E40f,-1E40f],HandDropChances:[-1E40f,-1E40f],HandItems:[{id:"minecraft:bow",Count:1b,tag:{Enchantments:[{id:"minecraft:punch",lvl:2s}]}},{}],Attributes:[{Name:"minecraft:generic.movement_speed",Modifiers:[{Amount:-0.1,Operation:2,UUID:[I;0,0,0,0]}]}]}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:skeleton",weight:1,multiplier:1.30,condition:{wave:{min:4},difficulty:{min:1,max:2}},data:{ArmorItems:[{id:"minecraft:iron_boots",Count:1b},{},{},{id:"minecraft:golden_helmet",Count:1b}],ArmorDropChances:[-1E40f,-1E40f,-1E40f,-1E40f],HandDropChances:[-1E40f,-1E40f],HandItems:[{id:"minecraft:bow",Count:1b,tag:{Enchantments:[{id:"minecraft:flame",lvl:1s},{id:"minecraft:punch",lvl:1s}]}},{}],Attributes:[{Name:"minecraft:generic.movement_speed",Modifiers:[{Amount:-0.1,Operation:0,UUID:[I;0,0,0,0]}]}]}}

# ウェーブごと召喚数: summon_count
data modify storage arena:assets stage_data[-1].summon_count set value [15, 18, 21, 25, 30]

# 体力値: health
data modify storage arena:assets stage_data[-1].health set value [16.0f, 20.0f, 24.0f, 28.0f, 32.0f]

# 攻撃力: strength
data modify storage arena:assets stage_data[-1].strength set value [3.0f, 3.5f, 4.0f, 4.5f, 5.0f]

# 移動速度: speed
data modify storage arena:assets stage_data[-1].speed set value [0.22f, 0.23f, 0.24f, 0.25f, 0.26f]

#> その他ステージ情報
# 報酬: reward
data modify storage arena:assets stage_data[-1].reward set value [3, 3, 3, 5]

# 獲得可能経験値
data modify storage arena:assets stage_data[-1].level_experience set value 8

# 入場可能人数
data modify storage arena:assets stage_data[-1].max_player set value 4

# 必要AP: required_ap
data modify storage arena:assets stage_data[-1].required_ap set value 1

# 名称: name
data modify storage arena:assets stage_data[-1].name set value "スケルトン"

# 翻訳キー: translation key
data modify storage arena:assets stage_data[-1].display.translation_key set value "entity.minecraft.skeleton"
