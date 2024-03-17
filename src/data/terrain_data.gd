extends BaseGameData
class_name TerrainData


var movement_cost: float
var model: Node3D
var flat_texture: Texture2D
var flat_material: StandardMaterial3D

func load_custom_data():
	flat_texture= GameData.load_texture("terrain/flat/" + name)
	flat_material= StandardMaterial3D.new()
	flat_material.albedo_texture= flat_texture
