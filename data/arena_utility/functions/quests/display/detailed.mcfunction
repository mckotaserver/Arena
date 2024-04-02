## tellraw macro代入
# tellraw
tellraw @s {"text": "▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬","color": "gray"}

$tellraw @s [{"translate":"kota-server.arena.quests.message.detailed_$(type)","with":[{"translate":"kota-server.arena.quests.$(id).name"},{"translate":"kota-server.arena.quests.$(id).description"},{"nbt":"display.detailed.progress_bar","storage":"arena_quests:temp","interpret":true},{"nbt":"display.detailed.percentage","storage":"arena_quests:temp"},{"nbt":"display.detailed.current_value","storage":"arena_quests:temp","color":"gold"},{"nbt":"display.detailed.object","storage":"arena_quests:temp","color":"gray"}]}]

tellraw @s {"text": "▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬","color": "gray"}
