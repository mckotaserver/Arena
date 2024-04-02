$execute unless data storage kota_library:temp {progress_bar_generation:{count_unfilled:0}} run data modify storage kota_library:temp progress_bar_generation.out.unfilled set value "$(unfilled)|"

execute store result storage kota_library:temp progress_bar_generation.count_unfilled int 0.999 run data get storage kota_library:temp progress_bar_generation.count_unfilled

execute unless data storage kota_library:temp {progress_bar_generation:{count_unfilled:0}} run function kota_library:misc/progress_bar_generation/unfilled_construction with storage kota_library:temp progress_bar_generation.out
