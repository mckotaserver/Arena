## 02-spider のステージ情報設定
# 項の作成
data modify storage arena:assets stage_data append value {id:"03-spider"}

#> 召喚データ
# Mob ID
data modify storage arena:assets stage_data[-1].mob_data set value []
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:spider",weight:6,multiplier:1.00,condition:{wave:{min:1},difficulty:{min:0,max:2}}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:cave_spider",weight:2,multiplier:1.30,condition:{wave:{min:2},difficulty:{min:1,max:2}},data:{Attributes:[{Name:"minecraft:generic.movement_speed",Modifiers:[{Amount:0.1,Operation:0,UUID:[I;0,0,0,0]}]},{Name:"minecraft:generic.attack_damage",Modifiers:[{Amount:0.1,Operation:2,UUID:[I;0,0,0,1]}]}]}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:spider",weight:1,multiplier:1.30,condition:{wave:{min:4},difficulty:{min:1,max:2}},data:{Passengers:[{id:"minecraft:skeleton",HandItems:[{id:"minecraft:bow",Count:1b,tag:{Enchantments:[{id:"minecraft:punch",lvl:2s}]}},{}],HandDropChances:[1E-40f,1E-40f]}]}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:spider",weight:2,multiplier:0.8,condition:{wave:{min:3},difficulty:{min:2,max:2}},data:{active_effects:[{amplifier:0,id:"minecraft:invisibility",duration:-1}]}}

# ウェーブごと召喚数: summon_count
data modify storage arena:assets stage_data[-1].summon_count set value [15, 18, 21, 25, 30]

# 体力値: health
data modify storage arena:assets stage_data[-1].health set value [20.0f, 24.0f, 28.0f, 32.0f, 36.0f]

# 攻撃力: strength
data modify storage arena:assets stage_data[-1].strength set value [3.0f, 3.5f, 4.0f, 4.5f, 5.0f]

# 移動速度: speed
data modify storage arena:assets stage_data[-1].speed set value [0.25f, 0.26f, 0.27f, 0.28f, 0.28f]

#> その他ステージ情報
# 報酬: reward
data modify storage arena:assets stage_data[-1].reward set value [4, 4, 4]

# 入場可能人数
data modify storage arena:assets stage_data[-1].max_player set value 4

# 必要AP: required_ap
data modify storage arena:assets stage_data[-1].required_ap set value 1

# 名称: name
data modify storage arena:assets stage_data[-1].name set value "スパイダー"

# 翻訳キー: translation key
data modify storage arena:assets stage_data[-1].display.translation_key set value "entity.minecraft.spider"
