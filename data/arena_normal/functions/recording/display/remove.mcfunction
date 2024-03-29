## ランキングディスプレイ 削除
# tellraw
execute as @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] run tellraw @p [{"text": "","color": "gold","extra":["(",{"nbt":"Pos[0]","entity": "@s"},", ",{"nbt":"Pos[1]","entity": "@s"},", ",{"nbt":"Pos[2]","entity": "@s"},")"]},{"text": "のランキング表示を削除しました。","color": "gray"}]

# kill
execute at @e[tag=arena.normal_stage.display.core,sort=nearest,limit=1] run kill @e[tag=arena.normal_stage.display.element,distance=..3]

