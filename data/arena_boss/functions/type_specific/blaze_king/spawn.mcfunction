## 召喚処理: ブレイズキング
# アニメーション
    # マーカー先行して設置
    execute at @e[tag=Arena.Boss.SpawnPos,sort=nearest,limit=1] run summon marker ~ ~ ~ {Tags:["Arena.Boss.Main.Core","Arena.Boss.Main.Element"]}

    # データ変更 → "spawn"
    function arena_boss:type_specific/blaze_king/animation/start {Animation:"spawn"}



