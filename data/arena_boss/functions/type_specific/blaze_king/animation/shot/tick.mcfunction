## 飛翔体 Tick処理
    # 飛ばす
    tp @s ^ ^ ^-0.5

    # プレイヤー近い → ダメージ
    execute as @a[tag=Arena.Boss.Player,dx=0] positioned ~-0.95 ~-0.95 ~-0.95 as @s[dx=0] at @s run damage @s 15 magic

# 消滅処理
    # かべのなかにいる
    execute unless block ~ ~ ~ air on passengers run kill @s
    execute unless block ~ ~ ~ air run kill @s

    # プレイヤーから離れた
    execute unless entity @p[tag=Arena.Boss.Player,distance=..32] on passengers run kill @s
    execute unless entity @p[tag=Arena.Boss.Player,distance=..32] run kill @s
