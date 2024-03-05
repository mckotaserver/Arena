## 実績の達成処理; 簡素化のためマクロで
$execute if entity @s[advancements={kota_server:arena/$(path)=false}] run advancement grant @s only kota_server:arena/$(path)
