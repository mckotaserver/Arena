## 内部リセット
# ボスバー
bossbar remove arena-boss:

# エンティティのkill
kill @e[tag=ArenaBoss.Element]
kill @e[tag=ArenaBoss.Minion]

kill @e[tag=ArenaBoss.Minion]

# プレイヤーの与ダメージリセット
execute as @a if score @s ArenaBoss.DamageDealt matches 1.. run scoreboard players set @s ArenaBoss.DamageDealt 0

# プレイヤーいないとき
execute unless entity @a[tag=Arena.Player,scores={Arena=101..}] run data modify storage arena-boss: Status.IsPlaying set value false
