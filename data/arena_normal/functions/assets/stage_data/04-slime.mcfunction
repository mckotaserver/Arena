## 02-slime のステージ情報設定
# 項の作成
data modify storage arena:assets stage_data append value {id:"04-slime"}

#> 召喚データ
# Mob ID
data modify storage arena:assets stage_data[-1].mob_data set value []
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:8,Multiplier:1.00,Condition:{Wave:{Min:1,Max:2},Difficulty:{Min:0,Max:2}},data:{Size:1}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:5,Multiplier:1.15,Condition:{Wave:{Min:2,Max:3},Difficulty:{Min:0,Max:2}},data:{Size:2}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:3,Multiplier:1.30,Condition:{Wave:{Min:3},Difficulty:{Min:1,Max:2}},data:{Size:3}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:1,Multiplier:1.5,Condition:{Wave:{Min:4},Difficulty:{Min:1,Max:2}},data:{Size:4}}

    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:1,Multiplier:1.00,Condition:{Wave:{Min:3},Difficulty:{Min:2,Max:2}},data:{Size:3,Passengers:[{id:"minecraft:slime",Size:2,Attributes:[{Name:"minecraft:generic.max_health",Base:60d}],Health:60f},{id:"minecraft:slime",Size:1,Attributes:[{Name:"minecraft:generic.max_health",Base:60d}],Health:60f}]}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:slime",weight:1,Multiplier:1.00,Condition:{Wave:{Min:5},Difficulty:{Min:2,Max:2}},data:{Size:3,Passengers:[{id:"minecraft:slime",Size:2,Attributes:[{Name:"minecraft:generic.max_health",Base:80d}],Health:80f,Passengers:[{id:"minecraft:slime",Size:1,Attributes:[{Name:"minecraft:generic.max_health",Base:60d}],Health:60f,Passengers:[{id:"minecraft:slime",Size:0,Attributes:[{Name:"minecraft:generic.max_health",Base:40d}],Health:40f}]}]}]}}

# ウェーブごと召喚数: summon_count
data modify storage arena:assets stage_data[-1].summon_count set value [12, 15, 18, 21, 24]

# 体力値: health
data modify storage arena:assets stage_data[-1].health set value [20.0f, 24.0f, 28.0f, 32.0f, 36.0f]

# 攻撃力: strength
data modify storage arena:assets stage_data[-1].strength set value [3.0f, 3.5f, 4.0f, 4.5f, 5.0f]

# 移動速度: speed
data modify storage arena:assets stage_data[-1].speed set value [0.25f, 0.26f, 0.27f, 0.28f, 0.29f]

#> その他ステージ情報
# 報酬: reward
data modify storage arena:assets stage_data[-1].reward set value [4, 4, 4]

# 入場可能人数
data modify storage arena:assets stage_data[-1].MaxPlayer set value 4

# 必要AP: RequiredAP
data modify storage arena:assets stage_data[-1].RequiredAP set value 1

# 名称: name
data modify storage arena:assets stage_data[-1].name set value "スライム"
