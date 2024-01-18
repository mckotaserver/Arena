## 召喚処理: ブレイズキング
# アニメーション
    # データ変更 → "spawn"
    function arena_boss:type_specific/blaze_king/animation/start {Animation:"spawn"}

    # マーカー一時設置
    execute at @e[tag=Arena.Boss.Stage-Core,sort=nearest,limit=1] run summon marker ~ ~ ~ {Tags:["Arena.Boss.Main.Core","Arena.Boss.Main.Element"]}

