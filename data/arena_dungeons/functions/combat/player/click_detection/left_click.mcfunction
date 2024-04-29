#> arena_dungeons:combat/player/click_detection/left_click

# トリガーリセット
advancement revoke @s only arena_dungeons:combat/player/click_detection/left_click

# function
function arena_dungeons:combat/player/click_detection/execute_function with entity @s SelectedItem.tag.arena.click_action.left

