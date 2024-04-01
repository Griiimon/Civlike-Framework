extends Node
class_name PlayerUnitsManager

signal all_units_done
signal unit_selected

enum Command { MOVE, WAIT, SKIP, END_TURN }

var selected_unit: MapUnitStack

var skip_list: Array[MapUnitStack]

var current_surface: WorldSurface

func send_command(_cmd: Command, _parameter):
	match _cmd:
		Command.MOVE:
			if selected_unit:
				assert(_parameter is Vector2i and _parameter.length_squared() == 1)
				var dir: Vector2i= _parameter
				var unit: UnitStack= selected_unit.units
				if unit.can_move() and unit.can_move_direction(dir):
					unit.move(dir)

func reset(_surface: WorldSurface):
	skip_list.clear()
	current_surface= _surface
	
	for surface_node in get_children():
		for map_unit_stack in surface_node.get_children():
			assert(map_unit_stack is MapUnitStack)
			map_unit_stack.units.reset_moves()

func report_turn_finished(_unit: MapUnitStack):
	skip_list.append(_unit)
	
	if _unit == selected_unit:
		select_next_surface_unit(current_surface)
	else:
		assert(false)

func select_unit(_unit: MapUnitStack):
	if selected_unit == _unit: return
	
	deselect()
	
	selected_unit= _unit
	selected_unit.on_select()

	unit_selected.emit(selected_unit)

func deselect():
	if selected_unit:
		selected_unit.on_deselect()
		selected_unit= null
	

func select_next_surface_unit(_surface: WorldSurface= null):
	if not _surface:
		assert(current_surface)
		_surface= current_surface
	
	var surface_node: Node= get_world().get_surface_node("Player", _surface.name)
	assert(surface_node)
	
	if skip_list.size() == surface_node.get_child_count():
		deselect()
		
		all_units_done.emit()
		return
	
	var target_unit: MapUnitStack
	if not selected_unit:
		if surface_node.get_child_count() > 0:
			target_unit= surface_node.get_child(0)
	else:
		if surface_node.get_child_count() > 1:
			target_unit= surface_node.get_next_unit(target_unit)
	
	if target_unit in skip_list:
		var find_unit: MapUnitStack
		
		while true:
			find_unit= surface_node.get_next_unit(find_unit)
			if find_unit == target_unit:
				all_units_done.emit()
				return
			
			if not find_unit in skip_list:
				target_unit= find_unit
				break
	
	select_unit(target_unit)


func get_next_unit(_surface_node: Node, _from: MapUnitStack)-> MapUnitStack:
	return _surface_node.get_child(wrapi(_from.get_index() + 1, 0, get_child_count()))

func get_world()-> World:
	return get_parent().get_parent()
