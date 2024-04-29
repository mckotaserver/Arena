# tellraw @s {"text": "==============================\n","color": "gray"}

execute store result storage arena_dungeons:temp reward_tellraw.in.Count int 1 run data get storage arena_dungeons:temp reward_tellraw.in.Count 

tellraw @s {"translate":"kota-server.arena.dungeons.message.reward_tellraw","with":[{"nbt":"reward_tellraw.in.tag.display.Name","storage": "arena_dungeons:temp","interpret": true,"hoverEvent": {"action": "show_text","contents": [{"nbt":"reward_tellraw.in.tag.display.Name","storage":"arena_dungeons:temp","interpret": true},"\n",{"nbt":"reward_tellraw.in.tag.display.Lore[]","storage":"arena_dungeons:temp","interpret": true,"separator": "\n","color": "gray"}]}},{"nbt":"reward_tellraw.in.Count","storage": "arena_dungeons:temp","color": "green"}]}

# tellraw @s {"text": "\n==============================","color": "gray"}
