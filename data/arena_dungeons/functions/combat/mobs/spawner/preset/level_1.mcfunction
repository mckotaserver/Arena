#> arena_dungeons:mobs/spawner/preset/level_1
    # スポナーのプリセット
    data modify storage arena_dungeons:temp mob_spawning.spawner.preset set value []

    data modify storage arena_dungeons:temp mob_spawning.spawner.preset append value "zombie"
    data modify storage arena_dungeons:temp mob_spawning.spawner.preset append value "skeleton"
    data modify storage arena_dungeons:temp mob_spawning.spawner.preset append value "armored_zombie"
    data modify storage arena_dungeons:temp mob_spawning.spawner.preset append value "armored_skeleton"
    data modify storage arena_dungeons:temp mob_spawning.spawner.preset append value "zombie_soldier"
    data modify storage arena_dungeons:temp mob_spawning.spawner.preset append value "skeleton_soldier"
    data modify storage arena_dungeons:temp mob_spawning.spawner.preset append value "zombie_knight"
    data modify storage arena_dungeons:temp mob_spawning.spawner.preset append value "skeleton_knight"
    data modify storage arena_dungeons:temp mob_spawning.spawner.preset append value "wondering_undead"

# スポナーの設置
function arena_dungeons:combat/mobs/spawner/place with storage arena_dungeons:temp mob_spawning.spawner
