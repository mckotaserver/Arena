## ステージのリセット
# 各種kill
    # Marker等
    kill @e[tag=Arena.Boss.Main.Element,distance=..64]

    # 
    tp @e[tag=Arena.Boss.Main.Extras,distance=..64] ~ -300 ~
    execute positioned ~ -300 ~ run kill @e[tag=Arena.Boss.Main.Element,distance=..4]

    # その他エンティティ
    kill @e[type=#arena_normal:resetting_entity,distance=..64]

    # モブ
    tp @e[type=#arena_normal:enemy,distance=..64] ~ -300 ~
    execute positioned ~ -300 ~ run kill @e[type=#arena_normal:enemy,distance=..4]

    