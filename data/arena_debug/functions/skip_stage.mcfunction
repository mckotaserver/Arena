kill @e[tag=arena.normal_stage.mob,distance=..64]
data modify entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.stage_data merge value {type:"normal",wave:5}


