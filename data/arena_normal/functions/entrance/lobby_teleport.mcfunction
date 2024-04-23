## ロビーへのテレポート
# 進捗の必要条件
$execute unless entity @s[advancements={kota_server:arena/$(advancements_requirement)=true}] at @e[tag=arena.normal_stage.gate_front,sort=nearest,limit=1] run tp @s ~ ~-0.25 ~

$execute unless entity @s[advancements={kota_server:arena/$(advancements_requirement)=true}] run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.game.message.entrance_no_requirement"}]

$execute unless entity @s[advancements={kota_server:arena/$(advancements_requirement)=true}] at @s run playsound minecraft:entity.illusioner.cast_spell master @s ~ ~ ~ 1 1.2 
$execute unless entity @s[advancements={kota_server:arena/$(advancements_requirement)=true}] at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1.2

$execute unless entity @s[advancements={kota_server:arena/$(advancements_requirement)=true}] run return 0

# タグ付与
tag @s add arena.temp.player_transfer

# TP
$execute at @e[tag=arena.normal_stage.lobby_$(lobby_name)] run tp @a[tag=arena.temp.player_transfer] ~ ~-0.5 ~ ~ ~

# 演出
$execute at @e[tag=arena.normal_stage.lobby_$(lobby_name)] run playsound entity.enderman.teleport master @a[tag=arena.temp.player_transfer] ~ ~ ~ 0.5 1
$execute at @e[tag=arena.normal_stage.lobby_$(lobby_name)] run particle portal ~ ~ ~ 0.5 0.5 0.5 0.1 20

# motion打ち消し
execute as @a[tag=arena.temp.player_transfer] run tp @s @s 

# 一時タグ除去
tag @a[tag=arena.temp.player_transfer] remove arena.temp.player_transfer

# displayが設置されていない場合: 召喚
$execute at @e[tag=arena.normal_stage.lobby_$(lobby_name)] positioned ^ ^-0.5 ^10 unless entity @e[tag=arena.normal_stage.selector_core,distance=..1] run summon marker ~ ~ ~ {Tags:["arena.normal_stage.selector_core","arena.normal_stage.selector_core"]}

$execute as @e[tag=arena.normal_stage.lobby_$(lobby_name)] at @s as @e[tag=arena.normal_stage.selector_core,sort=nearest,limit=1] facing ~ ~ ~ at @s run tp @s ~ ~ ~ ~ ~

# リセット処理
$execute as @e[tag=arena.normal_stage.lobby_$(lobby_name)] if data entity @s {data:{arena:{lobby_type:normal}}} at @s positioned ^ ^-0.5 ^10 as @e[tag=arena.normal_stage.selector_core,sort=nearest,limit=1] at @s run function arena_normal:entrance/stage_selector/reset_normal
$execute as @e[tag=arena.normal_stage.lobby_$(lobby_name)] if data entity @s {data:{arena:{lobby_type:endless}}} at @s positioned ^ ^-0.5 ^10 as @e[tag=arena.normal_stage.selector_core,sort=nearest,limit=1] at @s run function arena_normal:entrance/stage_selector/reset_endless
