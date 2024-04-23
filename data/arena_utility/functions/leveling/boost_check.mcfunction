execute store result score #misc.exp_boost.multiplier arena.temp run data get storage arena:utility exp_boost.multiplier 100

execute store result storage kota_library: time_unit_conversion.in.in int 1 run scoreboard players get #misc.exp_boost arena.utility
data modify storage kota_library: time_unit_conversion.in.option set value "tick_to_clock"

function kota_library:misc/time_unit_conversion/ with storage kota_library: time_unit_conversion.in
