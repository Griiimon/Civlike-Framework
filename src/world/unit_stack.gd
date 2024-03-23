class_name UnitStack


var coords: Vector2i
var units: Array[Unit]
var surface: WorldSurface
var faction: Faction


func can_move_direction(dir: Vector2i)-> bool:
	return can_move_to(coords + dir)

func can_move_to(target_pos: Vector2i)-> bool:
	var terrain: TerrainData= surface.get_terrain_at(target_pos)
	
	for unit in units:
		if not unit.can_enter_terrain(terrain): 
			return false
	
	var other_stacks: Array[UnitStack]= surface.get_unit_stacks_at(target_pos)
	
	for other_stack in other_stacks:
		if surface.world.diplomacy.are_faction_enemies(faction, other_stack.faction):
			return false

		
	return true
