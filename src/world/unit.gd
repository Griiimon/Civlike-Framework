class_name Unit

var unit_data: UnitData
var moves_left: int
var move_fractions_left: int	# for road movement


func can_enter_terrain(terrain: TerrainData)-> bool:
	return unit_data.can_enter_terrain(terrain)
