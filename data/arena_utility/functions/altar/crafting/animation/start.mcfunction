## アニメーション 開始
# アイテムの向きを中央に
execute as @e[tag=arena.Utility.Altar.PlacedItemDisplay,distance=..3] at @s run tp @s ~ ~ ~ facing entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1]

# フラグ設定
data modify entity @s data.arena.Altar.isCrafting set value true

# タイマー設定
execute store result score #EndTick arena.temp run time query gametime
scoreboard players add #EndTick arena.temp 40

execute store result entity @s data.arena.Timer.EndTick int 1 run scoreboard players get #EndTick arena.temp 

data modify entity @s data.arena.Scheduling set value "arena_utility:altar/crafting/animation/end"
schedule function arena_utility:altar/crafting/animation/timer 40t 

#> 成果物のデータ作成
    # アイテム出力の場合
    execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{inherit_core_item:false}}}} run data modify entity @s data.arena.Altar.Product set from storage arena_utility:temp Altar.Crafting.Refering.product

    # 強化レシピの場合
    execute if data storage arena_utility:temp {Altar:{Crafting:{Refering:{inherit_core_item:true}}}} run function arena_utility:altar/crafting/inherit_core_item/data_merging with storage arena_utility:temp Altar.Crafting.Refering.lore

#> 演出
    # playsound 
    playsound entity.illusioner.prepare_mirror master @a ~ ~ ~ 1 0.66
    playsound entity.illusioner.mirror_move master @a ~ ~ ~ 1 0.75
    playsound block.enchantment_table.use master @a ~ ~ ~ 1 0.75

    playsound block.ender_chest.open master @a ~ ~ ~ 0.66 0.75
    playsound entity.allay.ambient_with_item master @a ~ ~ ~ 1 0.75

    # particle 
    particle enchant ~ ~ ~ 0 0 0 4 500
    particle portal ~ ~ ~ 0 0 0 4 500
