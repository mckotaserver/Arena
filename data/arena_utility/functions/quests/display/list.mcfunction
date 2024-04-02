## クエスト 一覧表示
# tellraw (タイトル)
$tellraw @s [{"translate":"kota-server.arena.quests.message.list_$(type)"},"\n"]

# 一覧表示のためのセットアップ
    # Listの残り項数 (再起用)
    $data modify storage arena_quests:temp display.list.items_left set from storage arena:assets config.arena_quests.selection_count_$(type) 

    # Listのクエスト種類, index
    $data modify storage arena_quests:temp display.list.macro.type set value $(type)
    data modify storage arena_quests:temp display.list.macro.index set value 1

    # 1番目のidは個別で設定
    $data modify storage arena_quests:temp display.list.macro.id set from storage arena:quests $(type)[0].id

    # 変数代入, 再起処理
    function arena_utility:quests/display/list_macro with storage arena_quests:temp display.list.macro

# 末尾をそれっぽく
tellraw @s ""
tellraw @s {"text": "▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬","color": "gray"}

# playsound
playsound block.note_block.pling master @s ~ ~ ~ 1 2
playsound ui.button.click master @s ~ ~ ~ 1 2

# トリガーの設定
    # スコアのセット
    scoreboard players reset @s arena.trigger
    scoreboard players enable @s arena.trigger
