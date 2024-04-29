#> arena_dungeons:combat/mobs/spawner/on_work
# 選別からランダムに抽出 (5こ)
data modify storage kota_library: random_array_picker.in set from entity @s data.arena.dungeons.spawner_data

data modify storage kota_library: random_array_picker.option set value {count:5,allow_duplicates:true}
function kota_library:storage_modifier/random_array_picker with storage kota_library: random_array_picker.option

data modify storage arena_dungeons:temp mob_spawning.spawner.specify.id_list set from storage kota_library: random_array_picker.out 

# Scaleの計算
scoreboard players set #dungeons.spawner.scale.result arena.temp 100

    # フロア
    execute store result score #dungeons.spawner.scale.floor arena.temp run data get entity @e[tag=arena.dungeons.session_master,sort=nearest,limit=1] data.arena.dungeons.session_data.floor 0.999
    scoreboard players operation #dungeons.spawner.scale.floor arena.temp *= #10 Constant

    scoreboard players operation #dungeons.spawner.scale.result arena.temp += #dungeons.spawner.scale.floor arena.temp

    # 人数
    execute store result score #dungeons.spawner.scale.player arena.temp at @e[tag=arena.dungeons.session_master,sort=nearest,limit=1] if entity @a[tag=arena.dungeons.player,distance=..64] 
    scoreboard players operation #dungeons.spawner.scale.player arena.temp *= #20 Constant

    scoreboard players add #dungeons.spawner.scale.player arena.temp 80

    scoreboard players operation #dungeons.spawner.scale.result arena.temp *= #dungeons.spawner.scale.player arena.temp
    scoreboard players operation #dungeons.spawner.scale.result arena.temp /= #100 Constant

# 計算値を代入, 召喚処理
execute store result storage arena_dungeons:temp mob_spawning.spawner.specify.scale float 0.01 run scoreboard players get #dungeons.spawner.scale.result arena.temp
function arena_dungeons:combat/mobs/spawner/macro_assign

# playsound
playsound minecraft:entity.zombie.infect master @a[tag=arena.dungeons.player,distance=..16] ~ ~ ~ 5 1

# kill
kill @s
