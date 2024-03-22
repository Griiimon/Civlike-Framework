extends Node

var assets_dir: String
var data_dir: String

var terrain_types: Array[TerrainTypeData]
var terrains: Array[TerrainData]
var units: Array[UnitData]

var terrain_types_dict:= {}

func load_data(game_dir: String):
	game_dir= ProjectSettings.globalize_path(game_dir)
	assets_dir= game_dir + "/assets/"
	data_dir= game_dir + "/data/"
	prints("Assets", assets_dir)
	prints("Data", data_dir)
	
	terrain_types.assign(TerrainTypeData.parse_data_folder(data_dir + "terrain/types", TerrainTypeData.new().get_script()))
	build_data_dict(terrain_types_dict, terrain_types)
	
	terrains.assign(TerrainData.parse_data_folder(data_dir + "terrain", TerrainData.new().get_script()))
	units.assign(UnitData.parse_data_folder(data_dir + "units", UnitData.new().get_script()))

func build_data_dict(target_dictionary: Dictionary, source_array: Array):
	for item in source_array:
		assert(item is BaseGameData)
		target_dictionary[item.name]= item


func load_texture(path: String)-> Texture2D:
	return load(assets_dir + "textures/" + path + ".png")
