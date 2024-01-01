## TICK.
# ステージから離れたプレイヤー
execute as @a[tag=Arena.Normal-Stage.Player] at @s unless entity @e[tag=Arena.Normal-Stage.Stage-Core,distance=..48] run function arena_normal:misc/player_reset

#> モブごと 不都合解消用
# クリーパー: モブクリア判定
execute at @a[tag=Arena.Normal-Stage.Player] as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{StageData:{MobType:5},Timer:{WaveWaiting:false}}}} unless entity @e[tag=Arena.Normal-Stage.Mob,distance=..48] run function arena_normal:wave_process/mob_killed

# スライム: 分裂後を認識
execute at @a[tag=Arena.Normal-Stage.Player] as @e[tag=Arena.Normal-Stage.Stage-Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{StageData:{MobType:4},Timer:{WaveWaiting:false}}}} run tag @e[type=slime,distance=..48,tag=!Arena.Normal-Stage.Mob] add Arena.Normal-Stage.Mob
