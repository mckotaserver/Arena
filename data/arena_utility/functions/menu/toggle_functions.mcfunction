## メニュー: 機能切り替え
# タグ
    # 判定
    $execute store success storage arena:temp menu.functions.enabled byte 1 if entity @s[tag=$(tag)]

    # 付け外し
    $execute if data storage arena:temp {menu:{functions:{enabled:true}}} run tag @s remove $(tag)
    $execute if data storage arena:temp {menu:{functions:{enabled:false}}} run tag @s add $(tag)

# 演出
    # playsound 
    playsound ui.button.click master @s ~ ~ ~ 1 1.5

    execute if data storage arena:temp {menu:{functions:{enabled:false}}} run playsound block.note_block.pling master @s ~ ~ ~ 1 2
    execute if data storage arena:temp {menu:{functions:{enabled:true}}} run playsound block.note_block.pling master @s ~ ~ ~ 1 1

    # tellraw
    $execute if data storage arena:temp {menu:{functions:{enabled:false}}} run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.menu.message.toggle_functions","with":[{"translate":"kota-server.arena.menu.functions_name.$(name)"},{"translate":"kota-server.arena.menu.enabled"}]}]
    $execute if data storage arena:temp {menu:{functions:{enabled:true}}} run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.menu.message.toggle_functions","with":[{"translate":"kota-server.arena.menu.functions_name.$(name)"},{"translate":"kota-server.arena.menu.disabled"}]}]

