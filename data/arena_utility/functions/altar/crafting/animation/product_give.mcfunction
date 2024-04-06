## クラフトアニメーション 終了
#> Give
    # コンテナデータを作成
    data modify storage kota_library: direct_item_give.in set value []
    data modify storage kota_library: direct_item_give.in append from entity @s data.arena.Altar.Product
    execute as @p[tag=arena.Utility.Altar.User] at @s run function kota_library:misc/direct_item_give

#> 後処理
    # プレイヤーのタグ
    tag @p[tag=arena.Utility.Altar.User] remove arena.Utility.Altar.User

    # 
    execute in overworld run setblock 0 -64 0 bedrock

    # 配置済みアイテムの削除
    data modify entity @s data.arena.Altar.PlacedItem set value []

    # 使用中データ
    data modify entity @s data.arena.Altar.isCrafting set value false
    data modify entity @s data.arena.Altar.isUsing set value false
    
    # スケジュールまわりリセット
    scoreboard players reset @s arena.temp
    data modify entity @s data.arena.Scheduling set value ""
    