extends Node
class_name MapUnitStack

var units: UnitStack

func init(_unit_stack: UnitStack):
	units= _unit_stack
	units.map_object= self
	update_position()

func set_position():
	pass

func update_position():
	set_position()
