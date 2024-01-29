## 召喚値のAttributesを操作
# リセット
data modify storage arena:temp spawning_data.data_modifying.out set value {}

#> 事前に設定した値で乗算
    # summon_count
    data modify storage arena:temp spawning_data.data_modifying.out.summon_count set value 0.0f
    $execute store result storage arena:temp spawning_data.data_modifying.out.summon_count float 0.01 run data get storage arena:temp spawning_data.data_modifying.in.summon_count[$(index)] $(multiplier)

    # health
    data modify storage arena:temp spawning_data.data_modifying.out.health set value 0.0f
    $execute store result storage arena:temp spawning_data.data_modifying.out.health float 0.01 run data get storage arena:temp spawning_data.data_modifying.in.health[$(index)] $(multiplier)

    # strength
    data modify storage arena:temp spawning_data.data_modifying.out.strength set value 0.0f
    $execute store result storage arena:temp spawning_data.data_modifying.out.strength float 0.01 run data get storage arena:temp spawning_data.data_modifying.in.strength[$(index)] $(multiplier)

    # speed
    data modify storage arena:temp spawning_data.data_modifying.out.speed set value 0.0f
    $execute store result storage arena:temp spawning_data.data_modifying.out.speed float 0.005 run data get storage arena:temp spawning_data.data_modifying.in.speed[$(index)] $(speed_multiplier)

