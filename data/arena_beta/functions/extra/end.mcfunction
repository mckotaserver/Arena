# 終了可否判定
execute store success score $Temp.Clear Arena unless entity @e[tag=Arena.ExtraBoss]

    # 成功
    execute if score $Temp.Clear Arena matches 1 run tellraw @a[tag=Arena.Notice] [{"text":"Extraアリーナ (β)","bold": true,"color": "gold"},{"text":"を","color": "aqua","italic": false,"bold": true},{"selector":"@a[tag=Arena.Player,distance=..32]","bold": true,"color": "gold"},{"text":"さんがクリアしました！","bold": true,"color": "aqua"}]
    execute if score $Temp.Clear Arena matches 1 run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/endless/first_clear

    execute if score $Temp.Clear Arena matches 1 as @a[tag=Arena.Notice] at @s run playsound entity.player.levelup master @s ~ ~ ~ 

    execute if score $Temp.Clear Arena matches 1 as @e[tag=Arena.Lobby] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena run tp @a[tag=Arena.Player,distance=..20] @s
    execute if score $Temp.Clear Arena matches 1 as @a[tag=Arena.Player] if score @s Arena = @e[tag=Arena.Core,sort=nearest,limit=1] Arena run tag @s remove Arena.Player
    execute if score $Temp.Clear Arena matches 1 run function arena:reset

    # 失敗
    execute if score $Temp.Clear Arena matches 0 run tellraw @a[tag=Arena.Player,distance=..20] {"text":"敵がいない状態にしてもう一度ボタンを押してください","color":"aqua"}
    execute if score $Temp.Clear Arena matches 0 run playsound entity.shulker.hurt master @a ~ ~ ~ 5 1

    execute if score $Temp.Clear Arena matches 0 store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
    execute if score $Temp.Clear Arena matches 0 store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave int 1 run scoreboard players add $Wave Arena.Temp 1
    