extends BaseGameData
class_name TerrainData


var movement_cost: float
var model: Node3D
var flat_texture: Texture2D

func load_custom_data():
	flat_texture= GameData.load_texture("terrain/flat/" + name)
