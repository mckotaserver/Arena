## 02-creeper のステージ情報設定
# 項の作成
data modify storage arena:assets stage_data append value {id:"06-creeper"}

#> 召喚データ
# Mob ID
data modify storage arena:assets stage_data[-1].mob_data set value []
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:creeper",weight:5,Multiplier:1.00,Condition:{Wave:{Min:1},Difficulty:{Min:0,Max:2}},data:{ExplosionRadius:3}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:creeper",weight:6,Multiplier:1.10,Condition:{Wave:{Min:2},Difficulty:{Min:0,Max:2}},data:{ExplosionRadius:4}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:creeper",weight:3,Multiplier:1.20,Condition:{Wave:{Min:2},Difficulty:{Min:0,Max:2}},data:{ExplosionRadius:3,powered:true}}

    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:creeper",weight:3,Multiplier:1.20,Condition:{Wave:{Min:2},Difficulty:{Min:1,Max:2}},data:{ExplosionRadius:4,powered:true}}
    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:creeper",weight:1,Multiplier:1.00,Condition:{Wave:{Min:4},Difficulty:{Min:1,Max:2}},data:{ExplosionRadius:5}}

    data modify storage arena:assets stage_data[-1].mob_data append value {id:"minecraft:creeper",weight:3,Multiplier:0.75,Condition:{Wave:{Min:4},Difficulty:{Min:2,Max:2}},data:{ExplosionRadius:4,Fuse:10,Attributes:[{Name:"minecraft:generic.movement_speed",Modifiers:[{Amount:0.2,Operation:0,UUID:[I;0,0,0,0]}]}]}}

# ウェーブごと召喚数: summon_count
data modify storage arena:assets stage_data[-1].summon_count set value [15, 18, 21, 25, 30]

# 体力値: health
data modify storage arena:assets stage_data[-1].health set value [20.0f, 24.0f, 28.0f, 32.0f, 36.0f]

# 攻撃力: strength
data modify storage arena:assets stage_data[-1].strength set value [3.0f, 3.5f, 4.0f, 4.5f, 5.0f]

# 移動速度: speed
data modify storage arena:assets stage_data[-1].speed set value [0.25f, 0.26f, 0.27f, 0.28f, 0.29f]

#> モブ固有データ
# 爆発力: explosion_radius
# data modify storage arena:assets stage_data[-1].speed set value [3, 3, 4, 4, 5]

#> その他ステージ情報
# 報酬: reward
data modify storage arena:assets stage_data[-1].reward set value [3, 3, 3]

# 入場可能人数
data modify storage arena:assets stage_data[-1].max_player set value 4

# 必要AP: required_ap
data modify storage arena:assets stage_data[-1].required_ap set value 1

# 名称: name
data modify storage arena:assets stage_data[-1].name set value "クリーパー"