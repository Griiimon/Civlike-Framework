extends Node

var assets_dir: String
var data_dir: String

var terrains: Array[TerrainData]


func load_data(game_dir: String):
	game_dir= ProjectSettings.globalize_path(game_dir)
	assets_dir= game_dir + "/assets/"
	data_dir= game_dir + "/data/"
	prints("Assets", assets_dir)
	prints("Data", data_dir)
	
	terrains.assign(TerrainData.parse_data_folder(data_dir + "terrain", TerrainData.new().get_script()))


func load_texture(path: String)-> Texture2D:
	return load(assets_dir + "textures/" + path + ".png")
