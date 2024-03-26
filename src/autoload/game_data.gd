extends Node

var assets_dir: String
var data_dir: String

var game_settings: Dictionary
var rules: Dictionary
var world_settings: Dictionary
var appearance: AppearanceData


var terrain_types: Array[TerrainTypeData]
var terrains: Array[TerrainData]

var unit_tags: Array[UnitTagData]
var units: Array[UnitData]

var techs: Array[TechData]



var terrain_types_dict:= {}
var terrains_dict:= {}
var unit_tags_dict:= {}
var units_dict:= {}
var techs_dict:= {}

func load_data(game_dir: String):
	game_dir= ProjectSettings.globalize_path(game_dir)
	assets_dir= game_dir + "/assets/"
	data_dir= game_dir + "/data/"
	
	prints("Assets folder", assets_dir)
	prints("Data folder", data_dir)

	game_settings= BaseGameData.parse_json(data_dir + "game/settings.json") 
	world_settings= BaseGameData.parse_json(data_dir + "game/default_world_settings.json") 
	
	appearance= BaseGameData.create_obj_from_json("Appearance", data_dir + "game/appearance.json", AppearanceData.new().get_script())
	appearance.parse_data()
	assert(appearance.selected_unit_blinks)
	
	terrain_types.assign(BaseGameData.parse_data_folder(data_dir + "terrain/types", TerrainTypeData.new().get_script()))
	build_data_dict(terrain_types_dict, terrain_types)
	
	terrains.assign(BaseGameData.parse_data_folder(data_dir + "terrain", TerrainData.new().get_script()))
	build_data_dict(terrains_dict, terrains)
	
	
	
	unit_tags.assign(BaseGameData.parse_data_folder(data_dir + "units/tags", UnitTagData.new().get_script(), "default"))
	build_data_dict(unit_tags_dict, unit_tags)
	
	units.assign(UnitData.parse_data_folder(data_dir + "units", UnitData.new().get_script()))
	build_data_dict(units_dict, units)

	techs.assign(BaseGameData.parse_data_folder(data_dir + "techs", TechData.new().get_script()))
	build_data_dict(techs_dict, techs)


	parse_data()
	

func parse_data():
	parse_array_data(terrain_types)
	parse_array_data(terrains)
	parse_array_data(unit_tags)
	parse_array_data(units)
	parse_array_data(techs)


func parse_array_data(array: Array):
	for item in array:
		assert(item is BaseGameData)
		item.parse_data()

func build_data_dict(target_dictionary: Dictionary, source_array: Array):
	for item in source_array:
		assert(item is BaseGameData)
		target_dictionary[item.name]= item


func load_texture(path: String)-> Texture2D:
	#return ResourceLoader.load(assets_dir + "textures/" + path + ".png")

	path= assets_dir + "textures/" + path + ".png"
	var file = FileAccess.open(path, FileAccess.READ) 
	
	if FileAccess.get_open_error() != OK:
		push_error(str("File open error ", FileAccess.get_open_error(), " ", path))
		return null

	var fsize = file.get_length()
	var data = file.get_buffer(fsize)
	file.close()

	var image = Image.new()
	image.load_png_from_buffer(data)

	return ImageTexture.create_from_image(image)

