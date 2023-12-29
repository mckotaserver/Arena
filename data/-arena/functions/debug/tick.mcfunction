## Debug tick

# 情報表示
title @s[tag=!Arena.DebugBoss] actionbar ["Normal: [","MT: ",{"nbt":"data.Arena.MobType","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"}," WV: ",{"nbt":"data.Arena.Wave","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"}," DF: ",{"nbt":"data.Arena.Difficulty","entity": "@e[tag=Arena.Core,sort=nearest,limit=1]"},"]"]
title @s[tag=Arena.DebugBoss] actionbar [" Boss: [","Behavior: ",{"nbt":"Animation.Name","storage": "arena-boss:"}," Health: ",{"nbt":"Health","storage": "arena-boss:"},"]"]

# デバッグツール
execute as @e[type=potion,distance=..3] if data entity @s {Item:{tag:{Arena:{Item:DebugTool}}}} as @p[tag=Arena.Debug] run function arena:debug/tool/used_general
