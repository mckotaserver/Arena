## 召喚処理: ブレイズキング
# アニメーション
    # マーカー先行して設置
    execute at @e[tag=arena.boss.SpawnPos,sort=nearest,limit=1] run summon marker ~ ~ ~ {Tags:["arena.boss.Main.Core","arena.boss.Main.Element"]}

    # データ変更 → "spawn"
    function arena_boss:type_specific/blaze_king/animation/start {Animation:"spawn"}



