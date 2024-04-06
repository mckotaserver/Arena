## 実績達成処理
    # first_clear
    execute if data storage arena_normal:temp {stage_data:{difficulty:0}} run function arena_normal:misc/advancements_grant {path:"first_clear/easy"}
    execute if data storage arena_normal:temp {stage_data:{difficulty:1}} run function arena_normal:misc/advancements_grant {path:"first_clear/normal"}
    execute if data storage arena_normal:temp {stage_data:{difficulty:2}} run function arena_normal:misc/advancements_grant {path:"first_clear/hard"}

    # lonesome_challenge
    execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:0}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/zombie"}
    execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:1}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/skeleton"}
    execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:2}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/blaze"}
    execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:3}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/spider"}
    execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:4}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/slime"}
    execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1,mob_type:5}} run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/creeper"}

    execute if data storage arena_normal:temp {stage_data:{difficulty:2,player_count:1}} if entity @s[advancements={kota_server:arena/lonesome_challenge/zombie=true,kota_server:arena/lonesome_challenge/skeleton=true,kota_server:arena/lonesome_challenge/blaze=true,kota_server:arena/lonesome_challenge/spider=true,kota_server:arena/lonesome_challenge/slime=true,kota_server:arena/lonesome_challenge/creeper=true}] run function arena_normal:misc/advancements_grant {path:"lonesome_challenge/all"}
