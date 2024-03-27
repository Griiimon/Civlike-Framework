class_name UnitStack


var pos: Vector2i
var units: Array[Unit]
var surface: WorldSurface
var faction: Faction

var map_object: MapUnitStack


func _init(_surface: WorldSurface, _pos: Vector2i, _faction: Faction):
	surface= _surface
	pos= _pos
	faction= _faction
	
	
func add_unit(_unit: Unit):
	units.append(_unit)

func can_move_direction(_dir: Vector2i)-> bool:
	return can_move_to(pos + _dir)

func can_move()-> bool:
	for unit in units:
		if not unit.has_moves_left():
			return false
	
	return Hooks.set_hook(Hooks.Type.UNIT_STACK, "can_move", [ self ], true)
	
	#return true

func can_move_to(_target_pos: Vector2i)-> bool:
	if not surface.tiles.is_in_boundsv(_target_pos):
		return false
	
	if not can_stand_on(_target_pos):
		return false
	
	var other_stacks: Array[UnitStack]= surface.get_unit_stacks_at(_target_pos)
	
	for other_stack in other_stacks:
		if surface.world.diplomacy.are_faction_enemies(faction, other_stack.faction):
			return false

		
	return true


func can_stand_on(_target_pos: Vector2i)-> bool:
	var terrain: TerrainData= surface.get_terrain_at(_target_pos)

	for unit in units:
		if not unit.can_enter_terrain(terrain): 
			return false
	return true

func move(_dir: Vector2i):
	pos+= _dir
	
	var move_cost: int= surface.get_move_cost(pos)
	
	for unit in units:
		unit.moves_left= max(0, unit.moves_left - move_cost)
	
	update_position()

func update_position():
	if  map_object:
		map_object.update_position()

func get_first_display_unit()-> Unit:
	return units[0]


func get_world()-> World:
	return surface.world
