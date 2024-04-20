## /arena メニューオープン → 表示のための変数設定
# 存在しなければ新規登録
data modify storage kota_library: player_database.out set value -1
$function #kota_library:player_database {name:"$(player_name)",path:"arena.leveling.level",value:"",operation:"get"}

execute if data storage kota_library: {player_database:{out:-1}} run function arena_utility:leveling/setup

# プレイヤーのデータを取得
    # 取得function
    $function #kota_library:player_database {name:"$(player_name)",path:"arena.leveling",value:"",operation:"get"}

    # スコア化
    execute store result score #leveling.info.level arena.temp run data get storage kota_library: player_database.out.level

    execute store result score #leveling.info.experience.current arena.temp run data get storage kota_library: player_database.out.experience.current
    execute store result score #leveling.info.experience.required arena.temp run data get storage kota_library: player_database.out.experience.required


