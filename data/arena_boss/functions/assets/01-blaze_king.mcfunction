## データベース登録: blaze_king
# 項の作成
data modify storage arena:assets boss_data append value {"id": "01-blaze_king"}

# 表示関連
data modify storage arena:assets boss_data[-1].display_data set value {}

    # 表示名
    data modify storage arena:assets boss_data[-1].display_data.name set value '{"text": "", "extra": [{"text": "ブレイズキング", "color": "red"}]}'
    data modify storage arena:assets boss_data[-1].display_data.description set value "kota-server.arena.boss.water_boss.description"

    # 表示名 (翻訳キー)
    data modify storage arena:assets boss_data[-1].display_data.translation_key.name set value "kota-server.arena.boss.water_boss.name"
    data modify storage arena:assets boss_data[-1].display_data.translation_key.description set value "kota-server.arena.boss.water_boss.description"

# 入場情報
    # 必要AP
    data modify storage arena:assets boss_data[-1].required_ap set value 2

    # 最大入場可能人数
    data modify storage arena:assets boss_data[-1].max_player set value 4

# その他内部処理等
    # Death Loot
    data modify storage arena:assets boss_data[-1].loot set value "arena_boss:death_loot/water_boss"

    # ディレクトリ指定
    data modify storage arena:assets boss_data[-1].directory set value ""

    # マスターステージ？
    data modify storage arena:assets boss_data[-1].isMaster set value false
    