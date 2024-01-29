## Item Tag
# 項の作成
data modify storage arena:assets utility.item_tag append value {id:"00-swords"}

# 要素を羅列
data modify storage arena:assets utility.item_tag[-1].value set value []

    data modify storage arena:assets utility.item_tag[-1].value append value "minecraft:wooden_sword"
    data modify storage arena:assets utility.item_tag[-1].value append value "minecraft:stone_sword"
    data modify storage arena:assets utility.item_tag[-1].value append value "minecraft:iron_sword"
    data modify storage arena:assets utility.item_tag[-1].value append value "minecraft:golden_sword"
    data modify storage arena:assets utility.item_tag[-1].value append value "minecraft:diamond_sword"
    data modify storage arena:assets utility.item_tag[-1].value append value "minecraft:netherite_sword"

