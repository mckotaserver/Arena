## クエストごとに指定されたrequirement.typeの総数を取得
    #> 最初処理時; start_process: false
        execute unless data storage kota_library: random_array_picker.option.start_process run data modify storage kota_library: random_array_picker.option.start_process set value false

        # 出力をリセット
        execute if data storage kota_library: {random_array_picker:{option:{start_process:false}}} run data modify storage kota_library: random_array_picker.out set value []

        # 一時スコアボード
        execute if data storage kota_library: {random_array_picker:{option:{start_process:false}}} run scoreboard objectives add kota_library.temp dummy

        # 初回処理フラグの除去
        execute if data storage kota_library: {random_array_picker:{option:{start_process:false}}} run data modify storage kota_library: random_array_picker.option.start_process set value true

    #> 本処理
        # 乱数生成
        execute store result score #random_array_picker.index kota_library.temp run random value 0..999

        # inの要素数を取得
        execute store result score #random_array_picker.in_list_count kota_library.temp run data get storage kota_library: random_array_picker.in

        # 上で取得した合計数で剰余演算
        scoreboard players operation #random_array_picker.index kota_library.temp %= #random_array_picker.in_list_count kota_library.temp
#tellraw awabi2048 ["index: ",{"score":{"name": "#random_array_picker.index","objective": "kota_library.temp"}}]

        # 設定の確認
        $data modify storage kota_library: random_array_picker.option.allow_duplicates set value $(allow_duplicates)b

        # 入力を設定
        data modify storage kota_library: array_picker.in set from storage kota_library: random_array_picker.in
        execute store result storage kota_library: array_picker.option.index int 1 run scoreboard players get #random_array_picker.index kota_library.temp

        # array_pickerで取得
        data remove storage kota_library: array_picker.out

        execute if data storage kota_library: {random_array_picker:{option:{allow_duplicates:true}}} run data modify storage kota_library: array_picker.option.remove_index set value false
        execute if data storage kota_library: {random_array_picker:{option:{allow_duplicates:false}}} run data modify storage kota_library: array_picker.option.remove_index set value true

        function kota_library:storage_modifier/array_picker with storage kota_library: array_picker.option

        data modify storage kota_library: random_array_picker.out append from storage kota_library: array_picker.out
        data modify storage kota_library: random_array_picker.in set from storage kota_library: array_picker.in

    #> 再起まわり
        # カウントを1減算
        execute store result storage kota_library: random_array_picker.option.count int 0.9999 run data get storage kota_library: random_array_picker.option.count

        # 0でなければ再起
        execute unless data storage kota_library: {random_array_picker:{option:{count:0}}} run function kota_library:storage_modifier/random_array_picker with storage kota_library: random_array_picker.option

        # count: 0 → 処理の最後; スコアボード削除
        execute if data storage kota_library: {random_array_picker:{option:{count:0}}} run scoreboard objectives remove kota_library.temp
        execute if data storage kota_library: {random_array_picker:{option:{count:0}}} run data modify storage kota_library: random_array_picker.option.start_process set value false

