## データベース登録: blaze_king
# 項の作成
data modify storage arena:assets boss_data append value {"id": "01-fire_boss"}

# 表示関連
data modify storage arena:assets boss_data[-1].display_data set value {}

    # 表示名
    data modify storage arena:assets boss_data[-1].display_data.name set value "kota-server.arena.boss.fire_boss.name"
    data modify storage arena:assets boss_data[-1].display_data.description set value "kota-server.arena.boss.fire_boss.description"

# 入場情報
    # 必要AP
    data modify storage arena:assets boss_data[-1].required_ap set value 2

    # 最大入場可能人数
    data modify storage arena:assets boss_data[-1].max_player set value 4
