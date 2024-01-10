## メニュークリック時: クエスト一覧チェック
#> プレイヤー通知
    # playsound 
    playsound block.note_block.pling master @s ~ ~ ~ 1 2
    playsound ui.button.click master @s ~ ~ ~ 1 2

#> 今日のクエストの確認
    # 表示用データの取得
    

    # tellraw
    tellraw @s {"translate":"kota-server.arena.quests.message.check_daily"}

