## 配列から抽出くん
data remove storage arena_normal:temp ArrayPicking.out 
$data modify storage arena_normal:temp ArrayPicking.out set from storage arena_normal:temp ArrayPicking.in[$(index)]
