extends ExtendableGameObject
class_name Unit

var unit_data: UnitData
var moves_left: int
var move_fractions_left: int	# for road movement


func _init(_data: UnitData):
	unit_data= _data
	reset_moves()

func can_enter_terrain(terrain: TerrainData)-> bool:
	return unit_data.can_enter_terrain(terrain)

func has_moves_left()-> bool:
	return moves_left or move_fractions_left
	
func reset_moves():
	moves_left= unit_data.movement
