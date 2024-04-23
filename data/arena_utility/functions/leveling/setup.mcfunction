## アリーナレベル: セットアップ
# 初期データ作成
$function #kota_library:player_database {name:"$(player_name)",path:"arena.leveling",value:"{experience:{current:0,required:20},level:1}",operation:"modify.set"}

# 通知
tellraw @s[tag=arena.flags.debug] {"text": "アリーナレベルの統計をリセットしました。","color": "yellow"}
playsound block.enchantment_table.use master @s[tag=arena.flags.debug] ~ ~ ~ 1 2 
