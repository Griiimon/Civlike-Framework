extends BaseGameData
class_name UnitData


var model: Node3D
var icon: Texture2D
var texture: Texture2D

var movement: int
var tags: Array[UnitTagData]

func load_custom_data(_data: Dictionary):
	texture= GameData.load_texture("units/" + name)
	
	assert(_data.has("tags"))
	for tag in _data.tags:
		assert(GameData.unit_tags_dict.has(tag))
		tags.append(GameData.unit_tags_dict[tag])


func is_key_handled_customly(_key: String)-> bool:
	match _key:
		"tags":
			return true
	return false

func can_enter_terrain(terrain: TerrainData)-> bool:
	if is_terrain_blacklisted(terrain): return false
	return is_terrain_whitelisted(terrain)


func is_terrain_blacklisted(terrain: TerrainData)-> bool:
	for tag in tags:
		if terrain.type in tag.terrain_type_blacklist:
			return true
	return false

func is_terrain_whitelisted(terrain: TerrainData)-> bool:
	for tag in tags:
		if terrain.type in tag.terrain_type_whitelist:
			return true
	return false
