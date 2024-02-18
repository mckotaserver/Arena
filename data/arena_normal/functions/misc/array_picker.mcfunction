## 配列から抽出くん
data remove storage arena:temp ArrayPicking.out 
$data modify storage arena:temp ArrayPicking.out set from storage arena:temp ArrayPicking.in[$(index)]
