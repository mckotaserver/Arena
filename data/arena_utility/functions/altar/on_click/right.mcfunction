## Altar クリック右
# トリガー解除
advancement revoke @s only arena_utility:altar/on_click/right

# データのコピー
data modify storage arena_utility:temp Altar.data set from entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Altar

#> エラー出力
    # クラフト中 (警告はなし)
    execute if data storage arena_utility:temp {Altar:{data:{isCrafting:true}}} run return 0
    execute if data entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] {data:{Arena:{Scheduling:"arena_utility:altar/crafting/animation/product_give"}}} run return 0

    # ほかの人が使用中
    execute if data storage arena_utility:temp {Altar:{data:{isUsing:true}}} unless entity @s[tag=arena.Utility.Altar.User] run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.altar.message.error.someone_using"}]
    execute if data storage arena_utility:temp {Altar:{data:{isUsing:true}}} unless entity @s[tag=arena.Utility.Altar.User] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_utility:temp {Altar:{data:{isUsing:true}}} unless entity @s[tag=arena.Utility.Altar.User] run return 0
    
        #> 割り込み処理 → クラフト
        # Core Item があるならクラフトを試みる
        execute if predicate arena_utility:flags/is_sneaking if data storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}] run function arena_utility:altar/crafting/_ with storage arena_utility:temp Altar.data
        execute if predicate arena_utility:flags/is_sneaking if data storage arena_utility:temp Altar.data.PlacedItem[{isCore:true}] run return 0

    # アイテムを持っていない
    execute unless data entity @s SelectedItem run return 0

    # 設置限界値
    execute if data storage arena_utility:temp Altar.data.PlacedItem[23] run tellraw @s [{"translate":"kota-server.arena.game.message.prefix"}," ",{"translate":"kota-server.arena.boss.altar.message.error.max_placed"}]
    execute if data storage arena_utility:temp Altar.data.PlacedItem[23] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    execute if data storage arena_utility:temp Altar.data.PlacedItem[23] run return 0

#> アイテム関連
# ディスプレイの配置
    # 手元アイテムのデータをコピー
    data modify storage arena_utility:temp Altar.HoldingItem set from entity @s SelectedItem
    execute unless data storage arena_utility:temp Altar.HoldingItem.tag run data modify storage arena_utility:temp Altar.HoldingItem.tag set value {}

    # リストに追加
    data modify storage arena_utility:temp Altar.data.PlacedItem append from storage arena_utility:temp Altar.HoldingItem
    execute if predicate arena_utility:flags/is_sneaking run data modify storage arena_utility:temp Altar.data.PlacedItem[-1].isCore set value true

    # Markerへデータ戻す
    data modify entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Altar set from storage arena_utility:temp Altar.data

    # ディスプレイ風で配置
    function arena_utility:altar/item_placement/_

# プレイヤーからアイテム消去
item replace entity @s weapon.mainhand with air

#> 演出
    # 効果音
    execute at @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] run playsound ui.button.click master @a ~ ~ ~ 1 2
    execute at @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] run playsound entity.item.pickup master @a ~ ~ ~ 1 0.88
    execute at @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] run playsound minecraft:block.sculk_catalyst.break master @a ~ ~ ~ 1 2
    execute at @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] run playsound entity.illusioner.cast_spell master @a ~ ~ ~ 0.25 1.67

    execute if predicate arena_utility:flags/is_sneaking at @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] run playsound block.enchantment_table.use master @a ~ ~ ~ 1 0.79

#> フラグ設定
    # 使用中だよ！
    data modify entity @e[tag=arena.Utility.Altar.Core,sort=nearest,limit=1] data.Arena.Altar.isUsing set value true

    # ユーザー
    tag @s add Arena.Utility.Altar.User

