## メニュークリック時: クエスト一覧チェック
#> プレイヤー通知
    # playsound 
    playsound block.note_block.pling master @s ~ ~ ~ 1 2
    playsound ui.button.click master @s ~ ~ ~ 1 2

#> 今日のクエストの確認

$function arena_utility:quests/display/_ {index:0,type:"daily",player_name:"$(player_name)"}


