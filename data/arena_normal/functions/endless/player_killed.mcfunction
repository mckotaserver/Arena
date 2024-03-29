## プレイヤー倒される
# トリガー解除
advancement revoke @s only arena_normal:misc/player_killed

# エンドレスの場合のみ処理
execute unless data entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] {data:{arena:{stage_data:{type:"endless"}}}} run return 0

#> 記録を追加
# player_head召喚の準備
setblock ~ -64 ~ bedrock replace
setblock ~ -64 ~ barrel replace

# 実際の記録値は -1
execute store result storage arena_normal:temp recording.Actualrecord int 1 run data get entity @e[tag=arena.normal_stage.stage_core,sort=nearest,limit=1] data.arena.stage_data.wave 0.9999

function arena_normal:recording/endless with storage arena_normal:temp recording

setblock ~ -64 ~ bedrock replace
