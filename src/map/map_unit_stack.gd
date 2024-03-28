extends Node
class_name MapUnitStack

var units: UnitStack

var selected:= false

func init(_unit_stack: UnitStack):
	units= _unit_stack
	units.map_object= self
	update_position()

func set_position():
	pass

func update_position():
	set_position()

func on_select():
	if selected: return
	
	if GameData.appearance.selected_unit_blinks:
		start_blinking()
	
	selected= true
	
	get_player_units_manager().select_unit(self)
	
func report_turn_finished():
	get_player_units_manager().report_turn_finished(self)


func get_player_units_manager()-> PlayerUnitsManager:
	return get_parent().get_parent()

func on_deselect():
	if not selected: return

	if GameData.appearance.selected_unit_blinks:
		stop_blinking()

	selected= false


func start_blinking():
	pass

func stop_blinking():
	pass
