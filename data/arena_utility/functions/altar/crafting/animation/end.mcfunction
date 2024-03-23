## クラフトアニメーション 終了
#> アイテムまわり
# 素材アイテムは消す
    # ディスプレイのkill
    kill @e[tag=arena.Utility.Altar.PlacedItemDisplay,distance=..2]
    kill @e[tag=arena.Utility.Altar.PlacedItemMount,distance=..2]

# 完成品アイテムの配置
    # 仮item 召喚
    summon item ~ ~ ~ {Tags:["arena.Utility.Altar.ProductDisplay","arena.Utility.Altar.ProductDisplay-Unedited"],Item:{id:"minecraft:stone",Count:1b,tag:{}},Age:5925,PickupDelay:200,NoGravity:true}

    # 予め設定した成果物のデータを移動
    data modify entity @e[tag=arena.Utility.Altar.ProductDisplay-Unedited,limit=1] Item set from entity @s data.Arena.Altar.Product

    data modify entity @s data.Arena.Altar.PlacedItem set value []
    data modify entity @s data.Arena.Altar.PlacedItem append from entity @s data.Arena.Altar.Product

    # タグ除去
    tag @e[tag=arena.Utility.Altar.ProductDisplay-Unedited] remove Arena.Utility.Altar.ProductDisplay-Unedited

    # アイテムのGive
    execute store result score #EndTick Arena.Temp run time query gametime
    scoreboard players add #EndTick Arena.Temp 75
    execute store result entity @s data.Arena.Timer.EndTick int 1 run scoreboard players get #EndTick Arena.Temp 

    data modify entity @s data.Arena.Scheduling set value "arena_utility:altar/crafting/animation/product_give"
    schedule function arena_utility:altar/crafting/animation/timer 75t

#> 演出
    # playsound 
    playsound entity.illusioner.prepare_blindness master @a ~ ~ ~ 1 0.75
    playsound entity.illusioner.mirror_move master @a ~ ~ ~ 0.5 1.2
    playsound entity.allay.ambient_without_item master @a ~ ~ ~ 1 2

    playsound block.enchantment_table.use master @a ~ ~ ~ 1 0.66
    playsound entity.ender_dragon.ambient master @a ~ ~ ~ 0.3 1.4
    playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 0.4 0.7

    # particle 
    particle warped_spore ~ ~ ~ 0.5 0.5 0.5 1 50
    particle ash ~ ~ ~ 1 1 1 1 50

    particle soul_fire_flame ~ ~ ~ 0 0 0 1 100
    particle reverse_portal ~ ~ ~ 0 0 0 4 100

#> 後処理
    # タイマーリセット
    scoreboard players reset @s Arena.Temp