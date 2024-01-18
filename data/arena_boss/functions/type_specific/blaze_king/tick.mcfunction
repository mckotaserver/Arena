## Tick処理: ブレイズキング
# アニメーション
$execute as @e[tag=Arena.Boss.Main.Core,distance=..64] at @s run function arena_boss:type_specific/blaze_king/animation/$(Animation)/_

# タイマー加算
scoreboard players add @p[tag=Arena.Boss.Core-Player,sort=nearest,limit=1] ArenaBoss.Timer 1
