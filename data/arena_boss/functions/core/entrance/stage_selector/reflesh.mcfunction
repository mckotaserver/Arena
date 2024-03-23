## 表示内容の更新
#> text_display の中身
# Assetsからデータ取り出し

$data modify entity @e[tag=arena.boss.Selector.Element-04,sort=nearest,limit=1] text set value '{"text": "","extra": [{"text": "［","color": "white","bold": true},{"nbt": "boss_data[$(bossStage)].DisplayData.Name","storage":"arena:assets","color": "white", "bold": true, "interpret": true},{"text": "］","color": "white","bold": true}]}'
$data modify entity @e[tag=arena.boss.Selector.Element-07,sort=nearest,limit=1] text set value '{"text": "","extra": [{"text": "❖ ","color": "gold"},{"text": "最大プレイヤー数: ","color": "white"},{"nbt": "boss_data[$(bossStage)].max_player","storage":"arena:assets","color": "yellow","bold": true},{"text": "\\n❖ ","color": "gold"},{"text": "必要アリーナポイント: ","color": "white"},{"nbt": "boss_data[$(bossStage)].required_ap","storage":"arena:assets","color": "yellow","bold": true}]}'
