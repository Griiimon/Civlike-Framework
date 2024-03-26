extends Node
class_name PlayerUnitsManager

enum Command { MOVE, WAIT, SKIP, END_TURN }

var selected_unit: MapUnitStack

func send_command(_cmd: Command, _parameter):
	match _cmd:
		Command.MOVE:
			if selected_unit:
				assert(_parameter is Vector2i and _parameter.length_squared() == 1)
				var dir: Vector2i= _parameter
				var unit: UnitStack= selected_unit.units
				if unit.can_move_direction(dir):
					unit.move(dir)


func select_unit(_unit: MapUnitStack):
	if selected_unit == _unit: return
	
	if selected_unit:
		selected_unit.on_deselect()
	
	selected_unit= _unit
	selected_unit.on_select()
