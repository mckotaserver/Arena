## プレイヤー倒される
# トリガー解除
advancement revoke @s only arena_normal:misc/player_killed

# エンドレスの場合のみ処理
execute unless data entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] {data:{Arena:{StageData:{Type:"Endless"}}}} run return -1

#> 記録を追加
function arena_normal:recording/endless
