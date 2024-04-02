## クエストの表示
# 表示するデータを取得
$data modify storage arena_utility:temp quests.display.raw_data set from storage arena:quests $(type)[$(index)]
$data modify storage arena_utility:temp quests.display.raw_data.type set value "$(type)"

# 達成率の計算
data modify storage arena_utility:temp quests.display.progress_rate set value 0

    # 現在の達成回数を取得
    $execute store result score #progress_rate_calc.current arena.temp run data get storage arena:quests player_data[{player_name:"$(player_name)"}].$(type)[$(index)].progress.current

    # 目標回数を取得
    execute store result score #progress_rate_calc.goal arena.temp run data get storage arena_utility:temp quests.display.raw_data.requirement.count

    # 百分率で計算
    scoreboard players operation #progress_rate_calc.current arena.temp *= #100 Constant
    scoreboard players operation #progress_rate_calc.current arena.temp /= #progress_rate_calc.goal arena.temp

#> tellraw
    # 
    function arena_utility:quests/display/tellraw with storage arena_utility:temp quests.display

