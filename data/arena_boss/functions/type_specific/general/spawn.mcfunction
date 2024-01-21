## 召喚処理 共通
# マクロ代入
$function arena_boss:type_specific/$(Directory)/spawn

# フラグ解除
data modify entity @s data.Arena.Timer.WaveWaiting set value false