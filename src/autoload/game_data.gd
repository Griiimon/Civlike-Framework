extends Node

var data_dir: String

var terrains: Array[TerrainData]


func _init():
	load_data()

func load_data():
	data_dir= ProjectSettings.globalize_path("res://civ4 clone/assets/data/")
	
	terrains.assign(TerrainData.parse_data_folder(data_dir + "terrain"))
