# 召喚
# 本体
summon marker ~ ~ ~ {Tags:["ArenaBoss.Core","ArenaBoss.Element"],data:{ArenaBoss:{Name:"Thunder"}}}

# 当たり判定
summon vindicator ~ ~ ~ {Tags:["ArenaBoss.Hitbox","ArenaBoss.Element"],Silent:true,NoAI:true,PersistenceRequired:true,ActiveEffects:[{Id:14,Duration:2147483647,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.max_health",Base:1024.0d}],DeathLootTable:"empty",Health:1024.0f,CustomName:'{"text":""}',Passengers:[{id:"minecraft:vindicator",Tags:["ArenaBoss.Hitbox","ArenaBoss.Element"],Silent:true,NoAI:true,PersistenceRequired:true,ActiveEffects:[{Id:14,Duration:2147483647,ShowParticles:false}],Attributes:[{Name:"minecraft:generic.max_health",Base:1024.0d}],DeathLootTable:"empty",Health:1024.0f,CustomName:'{"text":""}'}]}



# Health
data modify storage arena-boss: Health set value 5000.0f
data modify storage arena-boss: MaxHealth set from storage arena-boss: Health 

bossbar add arena-boss: [{"text":"【","bold": true},{"text":"キングブレイズ","color": "gold","bold": true,"obfuscated": false},{"text":"】","bold": true}]

bossbar set arena-boss: players @a[tag=Arena.Player,distance=..32]
bossbar set arena-boss: max 2500
bossbar set arena-boss: value 2500

bossbar set arena-boss: color yellow
bossbar set arena-boss: style notched_10

# 攻撃行動
schedule function arena-boss:behavior/_ 2s
