## デイリークエスト 更新時
# クエスト選択
data modify storage arena:quests Daily set value [] 
data modify storage arena_utility:temp Quests.Daily.Selection.in set from storage arena:assets utility.quests

    # 乱数生成
    execute store result score #Quest.Selected-Daily Arena.Temp run random value 0..999
    execute store result score #Quest.Count-Daily Arena.Temp run data get storage arena:assets utility.quests[{type:"daily"}]

    execute store result storage arena_utility:temp Quests.Daily.Selection.Index int 1 run scoreboard players operation #Quest.Selected-Daily Arena.Temp %= #Quest.Count-Daily Arena.Temp

    function arena_utility:quests/daily/selection with storage arena_utility:temp Quests.Daily.Selection

