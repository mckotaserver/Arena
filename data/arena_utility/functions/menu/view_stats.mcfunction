## 統計情報の表示
# データなければ即席で作る
$execute unless data storage arena:stats normal[{Name:$(PlayerName)}].Mobs[{MobType:$(MobType)}].data run data modify storage arena:stats normal[{Name:$(PlayerName)}].Mobs[{MobType:$(MobType)}].data set value [0, 0, 0]

$data modify storage arena:temp Stats.Record set from storage arena:records normal[{name:"$(MobName)"}].data[{Name:"$(PlayerName)"}].DisplayData
$execute unless data storage arena:records normal[{name:"$(MobName)"}].data[{Name:"$(PlayerName)"}].DisplayData run data modify storage arena:temp Stats.Record set value "-:--:--.--"

# 演出
    # playsound
    playsound ui.button.click master @s ~ ~ ~ 1 2

    # tellraw
    $tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.menu.message.view_stats","with":[{"translate":"$(MobTranslationKey)","color": "green"},{"storage":"arena:stats","nbt":"normal[{Name:$(PlayerName)}].Mobs[{MobType:$(MobType)}].data[0]","color": "gold"},{"storage":"arena:stats","nbt":"normal[{Name:$(PlayerName)}].Mobs[{MobType:$(MobType)}].data[1]","color": "gold"},{"storage":"arena:stats","nbt":"normal[{Name:$(PlayerName)}].Mobs[{MobType:$(MobType)}].data[2]","color": "gold"},{"storage":"arena:temp","nbt":"Stats.Record","color": "aqua"}]}]
