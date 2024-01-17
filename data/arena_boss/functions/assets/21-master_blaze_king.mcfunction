## データベース登録: blaze_king
# 項の作成
data modify storage arena:assets boss_data append value {"id": "21-master_blaze_king"}

# 表示関連
data modify storage arena:assets boss_data[-1].display_data set value {}

    # 表示名
    data modify storage arena:assets boss_data[-1].display_data.name set value '{"text": "", "extra": [{"text": "マスター", "color": "#ff0000"},{"text": "・", "color": "gray"},{"text": "ブレイズキング", "color": "red"}]}'
    data modify storage arena:assets boss_data[-1].display_data.description set value "kota-server.arena.boss.fire_boss.description"

    # 表示名 (翻訳キー)
    data modify storage arena:assets boss_data[-1].display_data.translation_key.name set value "kota-server.arena.boss.fire_boss.name"
    data modify storage arena:assets boss_data[-1].display_data.translation_key.description set value "kota-server.arena.boss.fire_boss.description"

# 入場情報
    # 必要AP
    data modify storage arena:assets boss_data[-1].required_ap set value 4

    # 最大入場可能人数
    data modify storage arena:assets boss_data[-1].max_player set value 6

# 
    # Death Loot
    data modify storage arena:assets boss_data[-1].loot set value "arena_boss:death_loot/fire_boss"

    # マスターステージ？
    data modify storage arena:assets boss_data[-1].isMaster set value true
