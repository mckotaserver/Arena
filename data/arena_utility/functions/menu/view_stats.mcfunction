## 統計情報の表示
# データなければ即席で作る
$execute unless data storage arena:stats normal[{Name:$(playerName)}].Mobs[{mob_type:$(mob_type)}].data run data modify storage arena:stats normal[{Name:$(playerName)}].Mobs[{mob_type:$(mob_type)}].data set value [0, 0, 0]

$data modify storage arena:temp stats.Record set from storage arena:records normal[{name:"$(MobName)"}].data[{Name:"$(playerName)"}].DisplayData
$execute unless data storage arena:records normal[{name:"$(MobName)"}].data[{Name:"$(playerName)"}].DisplayData run data modify storage arena:temp stats.Record set value "-:--:--.--"

# 演出
    # playsound
    playsound ui.button.click master @s ~ ~ ~ 1 2

    # tellraw
    $tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.menu.message.view_stats","with":[{"translate":"$(MobTranslationKey)","color": "green"},{"storage":"arena:stats","nbt":"normal[{Name:$(playerName)}].Mobs[{mob_type:$(mob_type)}].data[0]","color": "gold"},{"storage":"arena:stats","nbt":"normal[{Name:$(playerName)}].Mobs[{mob_type:$(mob_type)}].data[1]","color": "gold"},{"storage":"arena:stats","nbt":"normal[{Name:$(playerName)}].Mobs[{mob_type:$(mob_type)}].data[2]","color": "gold"},{"storage":"arena:temp","nbt":"stats.Record","color": "aqua"}]}]
