## プレイヤー ボスへ攻撃時
#> 演出
    # playsound
    playsound entity.blaze.hurt master @a ~ ~ ~ 1 0.66
    playsound entity.ender_dragon.hurt master @a ~ ~ ~ 1 1.32

    # particle
    particle dust_color_transition 100000000 1 1 0.75 0.5 0 0 ~ ~1 ~ 0.5 1 0.5 1 20
    particle smoke ~ ~ ~ 0.5 1 0.5 0 20

#> ダメージ計算
    # ボスエンチャント
    execute store result score #bossDamageCalc.Additional Arena.Temp run data get entity @a[tag=arena.Temp-AttackerPlayer,limit=1] SelectedItem.tag.Arena.bossEnchantment.Lvl 20
    scoreboard players add #bossDamageCalc.Additional Arena.Temp 100

    # 総計
    execute store result score #bossDamageCalc.Amount Arena.Temp run data get storage arena_boss:temp OnAttacked.DamageAmount 100

    scoreboard players operation #bossDamageCalc.Amount Arena.Temp *= #bossDamageCalc.Additional Arena.Temp
    scoreboard players operation #bossDamageCalc.Amount Arena.Temp /= #100 Constant

    execute store result storage arena_boss:temp OnAttacked.DamageAmount int 0.01 run scoreboard players get #bossDamageCalc.Amount Arena.Temp
