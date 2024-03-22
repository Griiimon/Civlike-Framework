extends BaseGameData
class_name TerrainData


var type: TerrainTypeData 
var move_cost: float
var model: Node3D
var flat_texture: Texture2D
var flat_material: StandardMaterial3D


func load_custom_data(data: Dictionary):
	assert(data.terrain_type in GameData.terrain_types)
	type= GameData.terrain_types_dict[data.terrain_type]
	flat_texture= GameData.load_texture("terrain/flat/" + name)
	flat_material= StandardMaterial3D.new()
	flat_material.albedo_texture= flat_texture
