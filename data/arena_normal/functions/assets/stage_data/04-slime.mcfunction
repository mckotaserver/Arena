## 02-slime のステージ情報設定
# 項の作成
data modify storage arena:assets stage_data append value {id:"04-slime"}

#> 召喚データ
# Mob ID
data modify storage arena:assets stage_data[-1].mob_data set value []
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:8,multiplier:1.00,condition:{wave:{min:1},difficulty:{min:0,max:3}},data:{Size:1}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:5,multiplier:1.15,condition:{wave:{min:2},difficulty:{min:0,max:3}},data:{Size:2}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:3,multiplier:1.30,condition:{wave:{min:3},difficulty:{min:1,max:3}},data:{Size:3}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:1,multiplier:1.5,condition:{wave:{min:4},difficulty:{min:1,max:3}},data:{Size:4}}

    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:1,multiplier:1.00,condition:{wave:{min:3},difficulty:{min:2,max:3}},data:{Size:3,Passengers:[{id:"minecraft:slime",Size:2,Attributes:[{Name:"minecraft:generic.max_health",Base:60d}],Health:60f},{id:"minecraft:slime",Size:1,Attributes:[{Name:"minecraft:generic.max_health",Base:60d}],Health:60f}]}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:1,multiplier:1.00,condition:{wave:{min:5},difficulty:{min:2,max:3}},data:{Size:3,Passengers:[{id:"minecraft:slime",Size:2,Attributes:[{Name:"minecraft:generic.max_health",Base:80d}],Health:80f,Passengers:[{id:"minecraft:slime",Size:1,Attributes:[{Name:"minecraft:generic.max_health",Base:60d}],Health:60f,Passengers:[{id:"minecraft:slime",Size:0,Attributes:[{Name:"minecraft:generic.max_health",Base:40d}],Health:40f}]}]}]}}

# ウェーブごと召喚数: summon_count
data modify storage arena:assets stage_data[-1].summon_count set value [10, 12, 14, 16, 20]

# 体力値: health
data modify storage arena:assets stage_data[-1].health set value [20.0f, 24.0f, 28.0f, 32.0f, 36.0f]

# 攻撃力: strength
data modify storage arena:assets stage_data[-1].strength set value [3.0f, 3.5f, 4.0f, 4.5f, 5.0f]

# 移動速度: speed
data modify storage arena:assets stage_data[-1].speed set value [0.22f, 0.23f, 0.24f, 0.25f, 0.26f]

#> その他ステージ情報
# 報酬: reward
data modify storage arena:assets stage_data[-1].reward set value [4, 4, 4, 7]

# 獲得可能経験値
data modify storage arena:assets stage_data[-1].level_experience set value 10

# 入場可能人数
data modify storage arena:assets stage_data[-1].max_player set value 4

# 必要AP: required_ap
data modify storage arena:assets stage_data[-1].required_ap set value 1

# 名称: name
data modify storage arena:assets stage_data[-1].name set value "スライム"

# 翻訳キー: translation key
data modify storage arena:assets stage_data[-1].display.translation_key set value "entity.minecraft.slime"
