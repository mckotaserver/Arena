## 02-blaze のステージ情報設定
# 項の作成
data modify storage arena:assets stage_data append value {id:"02-blaze"}

#> 召喚データ
# Mob ID
data modify storage arena:assets stage_data[-1].mob_data set value []
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:blaze",weight:8,multiplier:1.00,condition:{wave:{min:1},difficulty:{min:0,max:2}}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:endermite",weight:1,multiplier:1.20,condition:{wave:{min:2},difficulty:{min:1,max:2}},data:{Attributes:[{Name:"minecraft:generic.movement_speed",Modifiers:[{Amount:0.2,Operation:2,UUID:[I;0,0,0,0]}]}]}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:wither_skeleton",weight:2,multiplier:1.50,condition:{wave:{min:3},difficulty:{min:2,max:2}},data:{DeathLootTable:"minecraft:empty",ArmorItems:[{id:"minecraft:iron_boots",Count:1b},{},{},{}],ArmorDropChances:[0.01f,0.01f,0.01f,0.01f],HandItems:[{id:"minecraft:stone_sword",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:2s}]}},{}],Attributes:[{Name:"minecraft:generic.movement_speed",Modifiers:[{Amount:-0.1,Operation:0,UUID:[I;0,0,0,0]}]}]}}

# ウェーブごと召喚数: summon_count
data modify storage arena:assets stage_data[-1].summon_count set value [15, 18, 21, 25, 30]

# 体力値: health
data modify storage arena:assets stage_data[-1].health set value [12.0f, 16.0f, 20.0f, 24.0f, 28.0f]

# 攻撃力: strength
data modify storage arena:assets stage_data[-1].strength set value [3.0f, 3.5f, 4.0f, 4.5f, 5.0f]

# 移動速度: speed
data modify storage arena:assets stage_data[-1].speed set value [0.25f, 0.26f, 0.27f, 0.28f, 0.29f]

#> その他ステージ情報
# 報酬: reward
data modify storage arena:assets stage_data[-1].reward set value [4, 4, 4]

# 入場可能人数
data modify storage arena:assets stage_data[-1].max_player set value 4

# 必要AP: required_ap
data modify storage arena:assets stage_data[-1].required_ap set value 1

# 名称: name
data modify storage arena:assets stage_data[-1].name set value "ブレイズ"

# 翻訳キー: translation key
data modify storage arena:assets stage_data[-1].display.translation_key set value "entity.minecraft.blaze"
