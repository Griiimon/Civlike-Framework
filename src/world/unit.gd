class_name Unit

var unit_data: UnitData
var moves_left: int
var move_fractions_left: int	# for road movement


func _init(_data: UnitData):
	unit_data= _data
	moves_left= unit_data.movement


func can_enter_terrain(terrain: TerrainData)-> bool:
	return unit_data.can_enter_terrain(terrain)
