## 経験値ブースト 使用
# 中断
execute if data storage arena:utility {exp_boost:{is_active:true}} run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.leveling.message.exp_boost_error"}]
execute if data storage arena:utility {exp_boost:{is_active:true}} run playsound entity.villager.no master @s ~ ~ ~ 1 1

execute if data storage arena:utility {exp_boost:{is_active:true}} run return 0

# 設定
data modify storage arena:utility exp_boost.is_active set value true

execute store result storage arena:utility exp_boost.multiplier float 0.01 run data get entity @s SelectedItem.tag.arena.exp_boost.multiplier
execute store result score #misc.exp_boost arena.utility run data get entity @s SelectedItem.tag.arena.exp_boost.time

# 演出
    # playsound
    playsound block.note_block.pling master @s ~ ~ ~ 1 2
    playsound entity.player.levelup master @s ~ ~ ~ 1 0.5

    # particle 
    particle composter ~ ~1 ~ 0.5 0.5 0.5 0.5 10
    particle totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.5 15

    # tellraw
    tellraw @a [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.leveling.message.exp_boost_start","with":[{"selector":"@s","color":"yellow"},{"nbt":"SelectedItem.tag.arena.exp_boost.multiplier","entity":"@s","color": "aqua"},{"text":"%","color":"aqua"}]}]

# clear
item replace entity @s weapon.mainhand with air
