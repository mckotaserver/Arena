## 召喚 メイン
#> 仮nbtデータ作成
data modify storage arena:temp spawning_data.mob_nbt set value {}

    # Attributes
    data modify storage arena:temp spawning_data.mob_nbt.Attributes set value [{Base:0d,Name:"minecraft:generic.max_health"},{Base:0d,Name:"minecraft:generic.attack_damage"},{Base:0d,Name:"minecraft:generic.movement_speed"}]

#> Attributes
    # 倍率適応前データの取得
    data get entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.

    # 倍率を計算
        # 共有処理
            # 難易度: 加算

            # ウェーブ: 加算 
            
            # 固有値: 乗算

        # エンドレスのみ処理
            # ウェーブ計算を5 (+1されるため内部的には4) に固定

    # データ修飾functionを呼び出し

#> Attributesによらない攻撃力
    # エフェクト付与
        # ボーナス値の計算

        # 付与

    # 弓持ちモブ: 弓のエンチャント
        # (必要なら) エンチャントの追加

        # ドロップしないように

        # レベルの適用

#> モブの召喚
    # rotated に利用する乱数の生成

    # function呼び出し
