## データベースへの登録 ダンジョン生成部屋
# 項の作成
data modify storage arena:assets dungeon.rooms append value {}

#> メインデータ
    # id
    data modify storage arena:assets dungeon.rooms[-1].id set value "test"

    # 大きさ
    data modify storage arena:assets dungeon.rooms[-1].size set value [1, 1]

    