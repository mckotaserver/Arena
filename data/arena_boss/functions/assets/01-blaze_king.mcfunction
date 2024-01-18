## データベース登録: blaze_king
# 項の作成
data modify storage arena:assets boss_data append value {"Id": "01-BlazeKing"}

# 表示関連
data modify storage arena:assets boss_data[-1].DisplayData set value {}

    # 表示名
    data modify storage arena:assets boss_data[-1].DisplayData.Name set value '{"text": "", "extra": [{"text": "ブレイズキング", "color": "red"}]}'
    data modify storage arena:assets boss_data[-1].DisplayData.Description set value "kota-server.arena.boss.blaze_king.description"

    # 表示名 (翻訳キー)
    data modify storage arena:assets boss_data[-1].DisplayData.TranslationKey.Name set value "kota-server.arena.boss.blaze_king.name"
    data modify storage arena:assets boss_data[-1].DisplayData.TranslationKey.Description set value "kota-server.arena.boss.blaze_king.description"

# 入場情報
    # 必要AP
    data modify storage arena:assets boss_data[-1].RequiredAP set value 2

    # 最大入場可能人数
    data modify storage arena:assets boss_data[-1].MaxPlayer set value 4

# その他内部処理等
    # Death Loot
    data modify storage arena:assets boss_data[-1].LootTable set value "arena_boss:death_loot/blaze_king"

    # ディレクトリ指定
    data modify storage arena:assets boss_data[-1].Directory set value "blaze_king"

    # マスターステージ？
    data modify storage arena:assets boss_data[-1].isMaster set value false
    