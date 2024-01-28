## SpawningData.detail_original をいい具合に書き換えるfunction
# リセット
data modify storage arena:temp SpawningData.Detail-Modified set value {}

#> 事前に設定したMultiplierで掛け算
# summon_count
data modify storage arena:temp SpawningData.Detail-Modified.summon_count set value 0
$execute store result storage arena:temp SpawningData.Detail-Modified.summon_count float 1 run data get storage arena:temp SpawningData.Detail-Original.summon_count[$(Wave)] $(Multiplier)

# health
data modify storage arena:temp SpawningData.Detail-Modified.health set value 0
$execute store result storage arena:temp SpawningData.Detail-Modified.health float 1 run data get storage arena:temp SpawningData.Detail-Original.health[$(Wave)] $(Multiplier)

# strength
data modify storage arena:temp SpawningData.Detail-Modified.strength set value 0
$execute store result storage arena:temp SpawningData.Detail-Modified.strength float 1 run data get storage arena:temp SpawningData.Detail-Original.strength[$(Wave)] $(Multiplier)

# speed
data modify storage arena:temp SpawningData.Detail-Modified.speed set value 0
$execute store result storage arena:temp SpawningData.Detail-Modified.speed float 0.001 run data get storage arena:temp SpawningData.Detail-Original.speed[$(Wave)] 1000

