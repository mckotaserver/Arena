# モブの情報変更時
execute as @a[tag=Arena.DisplayMobInfo] if score $DisplayMobInfo Arena matches 0.. run function arena:mob_data/detail

# プレイヤー数が変化した場合にソロプレイフラグ解除
execute at @a[tag=Arena.Player] as @e[tag=Arena.Core,distance=..32] at @s if data entity @s {data:{Arena:{Solo:true}}} as @a[distance=..32] unless score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Solo set value false

# スライム分裂時にタグ
execute at @a[tag=Arena.Player] as @e[type=slime,distance=..64,tag=!Arena.Mob] run tag @s add Arena.Mob

# 看板クールダウン設定用
execute at @a[tag=Arena.Player] as @e[tag=Arena.Timer,distance=..32] if data entity @s {PortalCooldown:0} run kill @s

# 会場から離れたプレイヤーのタグ除去, スコアリセット
execute as @a[tag=Arena.Player] at @s unless score @e[tag=Arena.Core,distance=..128,sort=nearest,limit=1] Arena = @s Arena run tag @s remove Arena.Player
execute as @a[tag=Arena.Player] at @s unless entity @e[tag=Arena.Core,distance=..128] run tag @s remove Arena.Player

execute as @a[tag=!Arena.Player] run scoreboard players set @s Arena 0

# デバッグ用
execute as @a[tag=Arena.Debug] at @s run function arena:debug/tick

# エンチャントの祭壇
#execute in minecraft:arena positioned 0 0 0 as @e[tag=ArenaBoss.Altar.Core,distance=0..] at @s run function arena-boss:enchanting_altar/tick

# ボス
execute at @r[tag=Arena.Player,scores={Arena=101..}] as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run function arena-boss:tick
