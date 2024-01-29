## データベース登録: blaze_king
# 項の作成
data modify storage arena:assets boss_data append value {"Id": "21-Master-BlazeKing"}

# 表示関連
data modify storage arena:assets boss_data[-1].DisplayData set value {}

    # 表示名
    data modify storage arena:assets boss_data[-1].DisplayData.Name set value '{"text": "", "extra": [{"text": "マスター", "color": "#ff0000"},{"text": "・", "color": "gray"},{"text": "ブレイズキング", "color": "red"}]}'
    data modify storage arena:assets boss_data[-1].DisplayData.Description set value "kota-server.arena.boss.blaze_king.description"

    # 表示名 (翻訳キー)
    data modify storage arena:assets boss_data[-1].DisplayData.TranslationKey.Name set value "kota-server.arena.boss.blaze_king.name"
    data modify storage arena:assets boss_data[-1].DisplayData.TranslationKey.Description set value "kota-server.arena.boss.blaze_king.description"

# 入場情報
    # 必要AP
    data modify storage arena:assets boss_data[-1].required_ap set value 4

    # 最大入場可能人数
    data modify storage arena:assets boss_data[-1].max_player set value 6

# 召喚関係
data modify storage arena:assets boss_data[-1].EntityData set value {}

    # 体力
    data modify storage arena:assets boss_data[-1].EntityData.Health set value 4000

    # 攻撃
    data modify storage arena:assets boss_data[-1].EntityData.BaseStrength set value 20

# 
    # Death Loot
    data modify storage arena:assets boss_data[-1].LootTable set value "arena_boss:death_loot/master_blaze_king"

    # ディレクトリ指定
    data modify storage arena:assets boss_data[-1].Directory set value "blaze_king"

    # マスターステージ？
    data modify storage arena:assets boss_data[-1].isMaster set value true
