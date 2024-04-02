$execute unless data storage kota_library:temp {progress_bar_generation:{count_filled:0}} run data modify storage kota_library:temp progress_bar_generation.out.filled set value "$(filled)|"

execute store result storage kota_library:temp progress_bar_generation.count_filled int 0.999 run data get storage kota_library:temp progress_bar_generation.count_filled

execute unless data storage kota_library:temp {progress_bar_generation:{count_filled:0}} run function kota_library:misc/progress_bar_generation/filled_construction with storage kota_library:temp progress_bar_generation.out
execute if data storage kota_library:temp {progress_bar_generation:{count_filled:0}} run function kota_library:misc/progress_bar_generation/unfilled_construction with storage kota_library:temp progress_bar_generation.out

