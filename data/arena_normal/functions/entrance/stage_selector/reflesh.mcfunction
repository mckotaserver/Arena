## 表示内容の更新
#> text_display の中身
# Assetsからデータ取り出し

$data modify entity @e[tag=Arena.Normal-Stage.Selector.Element-04,sort=nearest,limit=1] text set value '{"text": "","extra": [{"text": "［","color": "white","bold": true},{"nbt": "stage_data[$(MobType)].name","storage":"arena:assets","color": "white", "bold": true},{"text": "］","color": "white","bold": true},{"text": "\\n［","color": "white","bold": true},{"nbt": "stage_difficulty[$(Difficulty)].name","storage":"arena:assets","interpret":true},{"text": "］","color": "white","bold": true}]}'
$data modify entity @e[tag=Arena.Normal-Stage.Selector.Element-07,sort=nearest,limit=1] text set value '{"text": "","extra": [{"text": "❖ ","color": "gold"},{"text": "最大プレイヤー数: ","color": "white"},{"nbt": "stage_data[$(MobType)].max_player","storage":"arena:assets","color": "yellow","bold": true},{"text": "\\n❖ ","color": "gold"},{"text": "必要アリーナポイント: ","color": "white"},{"nbt": "stage_data[$(MobType)].required_ap","storage":"arena:assets","color": "yellow","bold": true},{"text": "\\n❖ ","color": "gold"},{"text": "報酬: ","color": "white"},{"nbt": "stage_difficulty[$(Difficulty)].reward","storage":"arena:assets","interpret":true,"color": "yellow","bold": true},{"text": "x","color": "white"},{"nbt": "stage_data[$(MobType)].reward[$(Difficulty)]","storage":"arena:assets"}]}'
