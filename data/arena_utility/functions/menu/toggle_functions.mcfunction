## メニュー: 機能切り替え
# タグ
    # 判定
    $execute store success storage arena:temp Menu.Functions.Enabled byte 1 if entity @s[tag=$(Tag)]

    # 付け外し
    $execute if data storage arena:temp {Menu:{Functions:{Enabled:true}}} run tag @s remove $(Tag)
    $execute if data storage arena:temp {Menu:{Functions:{Enabled:false}}} run tag @s add $(Tag)

# 演出
    # playsound 
    playsound ui.button.click master @s ~ ~ ~ 1 1.5

    execute if data storage arena:temp {Menu:{Functions:{Enabled:false}}} run playsound block.note_block.pling master @s ~ ~ ~ 1 2
    execute if data storage arena:temp {Menu:{Functions:{Enabled:true}}} run playsound block.note_block.pling master @s ~ ~ ~ 1 1

    # tellraw
    $execute if data storage arena:temp {Menu:{Functions:{Enabled:false}}} run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.menu.message.toggle_functions","with":[{"translate":"kota-server.arena.menu.functions_name.$(Name)"},{"translate":"kota-server.arena.menu.enabled"}]}]
    $execute if data storage arena:temp {Menu:{Functions:{Enabled:true}}} run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.menu.message.toggle_functions","with":[{"translate":"kota-server.arena.menu.functions_name.$(Name)"},{"translate":"kota-server.arena.menu.disabled"}]}]

