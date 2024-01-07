kill @e[tag=Arena.Normal-Stage.Mob,distance=..64]

data modify entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena merge value {Wave:5,Spawning:{Counter:0},Type:"Normal"}
function arena_normal:wave_process/mob_killed
