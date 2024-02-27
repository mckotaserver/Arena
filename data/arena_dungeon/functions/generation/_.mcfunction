## ダンジョン生成 メイン
#> forceload
    # 
    execute in minecraft:overworld run forceload add -1 -1 1 1

#> リセット
    # 仮置きの設置
    fill 13 -64 13 -13 64 -13 barrier{Items:[{Slot:0b,id:"minecraft:stone",tag:{arena_dungeon_generation:{filled:false,room_data:{size:[0, 0],id:"temp"}}}}]}

    