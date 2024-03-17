extends Node

var assets_dir: String
var data_dir: String

var terrains: Array[TerrainData]


func _ready():
	load_data()

func load_data():
	assets_dir= ProjectSettings.globalize_path("res://civ4 clone/assets/")
	data_dir= assets_dir + "data/"
	
	terrains.assign(TerrainData.parse_data_folder(data_dir + "terrain", TerrainData.new().get_script()))


func load_texture(path: String)-> Texture2D:
	return load(assets_dir + "textures/" + path + ".png")
