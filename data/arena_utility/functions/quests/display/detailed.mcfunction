## tellraw macro代入
# tellraw
tellraw @s {"text": "▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬","color": "gray"}

$tellraw @s [{"translate":"kota-server.arena.quests.message.detailed","with":[{"translate":"kota-server.arena.quests.$(id).name"},{"translate":"kota-server.arena.quests.$(id).description"},{"nbt":"display.detailed.progress_bar","storage":"arena_quests:temp","interpret":true},{"nbt":"display.detailed.progress_rate","storage":"arena_quests:temp","color":"$(rate_color)"},{"nbt":"display.detailed.current_value","storage":"arena_quests:temp","color":"gold"},{"nbt":"display.detailed.objective","storage":"arena_quests:temp","color":"gray"},{"text":"%", "color":"gray"}]}]

tellraw @s {"text": "▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬","color": "gray"}
