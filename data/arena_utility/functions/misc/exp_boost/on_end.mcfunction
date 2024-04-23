## 経験値ブースト 終了
# 設定
data modify storage arena:utility exp_boost.is_active set value false

data modify storage arena:utility exp_boost.multiplier set value 0.0f

scoreboard players reset #misc.exp_boost arena.utility

# 演出
    # playsound
    playsound block.note_block.pling master @s ~ ~ ~ 1 2
    playsound minecraft:entity.villager.celebrate master @s ~ ~ ~ 1 1

    # tellraw
    tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.leveling.message.exp_boost_end"}]
