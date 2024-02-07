kill @e[tag=Arena.Normal-Stage.Mob,distance=..64]
data modify entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] data.Arena.StageData merge value {Type:"Normal",wave:5}


