## TICK.
# ステージから離れたプレイヤー
execute as @a[tag=Arena.Normal-Stage.Player] at @s unless entity @e[tag=Arena.Normal-Stage.Stage-Core,distance=..48] run function arena_normal:misc/player_reset

# クリーパー: モブクリア判定
execute at @a[tag=Arena.Normal-Stage.Player] as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{StageData:{MobType:5},Timer:{WaveWaiting:false}}}} unless entity @e[tag=Arena.Normal-Stage.Mob,distance=..48] run function arena_normal:wave_process/mob_killed

