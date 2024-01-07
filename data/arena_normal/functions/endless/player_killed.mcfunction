## プレイヤー倒される
# エンドレスの場合のみ処理
execute unless data entity @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] {data:{Arena:{StageData:{Type:"Endless"}}}} run return -1

#> 記録を追加
    # 