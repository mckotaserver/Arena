## 01-zombie のステージ情報設定
# 項の作成
data modify storage arena:assets stage_difficulty append value {id:"01-normal"}

#> その他ステージ情報
# 表示情報
    # 表示名
    data modify storage arena:assets stage_difficulty[-1].display.name set value '{"text":"ノーマル","color":"yellow","bold":true}'

    # 表示名(翻訳キー)
    data modify storage arena:assets stage_difficulty[-1].display.translation_key set value "kota-server.arena.game.difficulty.normal"

    # 報酬の表示
    data modify storage arena:assets stage_difficulty[-1].display.reward set value '{"text":"アリーナチケット","color": "gold","extra":[{"text":"【中級】","color": "yellow"}]}'

    # 表示色
    data modify storage arena:assets stage_difficulty[-1].display.color set value "yellow"

# 報酬
data modify storage arena:assets stage_difficulty[-1].reward set value "arena_normal:ticket/normal"

# 倍率
data modify storage arena:assets stage_difficulty[-1].multiplier set value 1.85f

# 倍率
data modify storage arena:assets stage_difficulty[-1].speed_multiplier set value 1f
