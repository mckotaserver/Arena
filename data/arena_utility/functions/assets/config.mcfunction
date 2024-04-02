## Config
data modify storage arena:assets config set value {}

#> PvE arena 
data modify storage arena:assets config.arena_normal set value {}

    # エンドレス; ウェーブごとの倍率上昇(%)
    data modify storage arena:assets config.arena_normal.endless.wave_bonus set value 6

    # エンドレス; 入場可能プレイヤー数
    data modify storage arena:assets config.arena_normal.endless.max_player set value 6

    # エンドレス; 必要AP
    data modify storage arena:assets config.arena_normal.endless.required_ap set value 2

    # エンドレス; 報酬(比例量, 割合)
    data modify storage arena:assets config.arena_normal.endless.reward.proportion_rate set value 0.1

    # エンドレス; 報酬(加算量)
    data modify storage arena:assets config.arena_normal.endless.reward.addition set value 5

#> arena Quests
data modify storage arena:assets config.arena_quests set value {}

    # デイリークエストの選択個数
    data modify storage arena:assets config.arena_quests.selection_count_daily set value 3
    
    # ウィークリークエストの選択個数
    data modify storage arena:assets config.arena_quests.selection_count_weekly set value 3
