#> AssetsのLoad
# リセット
data modify storage arena:assets stage_difficulty set value []

# 難易度データ読み込み
function arena_normal:assets/difficulty/00-easy
function arena_normal:assets/difficulty/01-normal
function arena_normal:assets/difficulty/02-hard
