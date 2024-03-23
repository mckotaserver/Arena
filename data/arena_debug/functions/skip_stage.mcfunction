kill @e[tag=arena.normal-stage.Mob,distance=..64]
data modify entity @e[tag=arena.normal-stage.Stage-Core,sort=nearest,limit=1] data.Arena.stage_data merge value {Type:"Normal",wave:5}


