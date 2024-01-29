## 01-zombie のステージ情報設定
# 項の作成
data modify storage arena:assets stage_difficulty append value {id:"02-hard"}

#> その他ステージ情報
# 表示情報
    # 表示名
    data modify storage arena:assets stage_difficulty[-1].display.name set value '{"text":"ハード","color":"red","bold":true}'

    # 表示名(翻訳キー)
    data modify storage arena:assets stage_difficulty[-1].display.translation_key set value "kota-server.arena.game.difficulty.hard"

    # 報酬の表示
    data modify storage arena:assets stage_difficulty[-1].display.reward set value '{"text":"アリーナチケット","color": "gold","extra":[{"text":"【上級】","color": "red"}]}'

    # 表示色
    data modify storage arena:assets stage_difficulty[-1].display.color set value "red"

# 報酬
data modify storage arena:assets stage_difficulty[-1].reward set value "arena_normal:ticket/hard"

# 倍率
data modify storage arena:assets stage_difficulty[-1].multiplier set value 1.8f
