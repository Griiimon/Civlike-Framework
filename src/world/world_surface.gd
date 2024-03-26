class_name WorldSurface

var name: String

var width: int
var height: int

var tiles: Array2D

var unit_stacks: Array[UnitStack]

var world: World

func _init(_name: String, _width: int, _height: int, _world: World):
	name= _name
	width= _width
	height= _height
	world= _world

func generate_default_tiles():
	assert(not GameData.terrains.is_empty())
	
	tiles= Array2D.new(width, height)
	
	for x in width:
		for y in height:
			tiles.put(x, y, GameData.terrains[0])

func spawn_unit(_unit_data: UnitData, _pos: Vector2i, faction: Faction)-> UnitStack:
	var unit_stack:= UnitStack.new(self, _pos, faction)
	unit_stack.add_unit(Unit.new(_unit_data))
	assert(unit_stack.can_stand_on(_pos))
	
	return unit_stack

func get_unit_stacks_at(_target_pos)-> Array[UnitStack]:
	var result: Array[UnitStack]= []
	
	for stack in unit_stacks:
		if stack.pos == _target_pos:
			result.append(stack)
	
	return result

func get_terrain_at(_pos: Vector2i)-> TerrainData:
	return tiles.readv(_pos)

func is_empty()-> bool:
	return not tiles
