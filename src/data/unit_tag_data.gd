extends BaseGameData
class_name UnitTagData

var terrain_type_whitelist: Array[TerrainTypeData]
var terrain_type_blacklist: Array[TerrainTypeData]

func load_custom_data(data: Dictionary):
	for key in data.terrain_type_whitelist:
		assert(key in GameData.terrain_types_dict)
		terrain_type_whitelist.append(GameData.terrain_types_dict[key])

	for key in data.terrain_type_blacklist:
		assert(key in GameData.terrain_types_dict)
		terrain_type_blacklist.append(GameData.terrain_types_dict[key])


func is_key_handled_customly(key: String)-> bool:
	match key:
		"terrain_type_whitelist", "terrain_type_blacklist":
			return true
			
	return false
