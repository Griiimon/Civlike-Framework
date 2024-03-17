extends BaseGameData
class_name UnitData


var model: Node3D
var icon: Texture2D
var texture: Texture2D

var movement: int
var strength: int

func load_custom_data():
	texture= GameData.load_texture("units/" + name)
