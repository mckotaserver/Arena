## AssetsのLoad
# リセット
data modify storage arena:assets stage_data set value []

# モブデータ読み込み
function arena_normal:assets/stage_data/01-zombie
function arena_normal:assets/stage_data/02-skeleton
function arena_normal:assets/stage_data/03-blaze
function arena_normal:assets/stage_data/04-spider
function arena_normal:assets/stage_data/05-slime
function arena_normal:assets/stage_data/06-creeper
# function arena_normal:assets/stage_data/07-guardian
function arena_normal:assets/stage_data/08-endless

# Difficulty
data modify storage arena:assets stage_difficulty set value [{"name":'{"text":"イージー","color":"green","bold":true}',"reward":'{"text":"アリーナチケット","color": "gold","extra":[{"text":"【初級】","color": "green"}]}'}, {"name":'{"text":"ノーマル","color":"yellow","bold":true}',"reward":'{"text":"アリーナチケット","color": "gold","extra":[{"text":"【中級】","color": "yellow"}]}'}, {"name":'{"text":"ハード","color":"red","bold":true}',"reward":'{"text":"アリーナチケット","color": "gold","extra":[{"text":"【上級】","color": "red"}]}'}]

