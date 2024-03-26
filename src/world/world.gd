extends Node
class_name World

@export var width: int= 20
@export var height: int= 20


@export var map_unit_scene: PackedScene

@onready var units: Node = $Units
@onready var player_units: PlayerUnitsManager = $Units/Player


var surfaces: Array[WorldSurface]

var diplomacy: Diplomacy= Diplomacy.new()


func init():
	surfaces.append(WorldSurface.new("default", width, height, self))
	
func tick():
	pass

func generate():
	assert("generator" in GameData.world_settings)
	var generator: Dictionary= GameData.world_settings.generator
	var script: GDScript
	
	match generator.type:
		"fill":
			script= load("res://src/world/generators/world_generator_fill.gd")
		
	var obj: WorldGenerator= script.new()
	obj.run(self, generator.parameters)
	

func generate_flat():
	if get_main_surface().is_empty():
		get_main_surface().generate_default_tiles()
	
	render_surface(get_main_surface())


func spawn_unit(_unit_data: UnitData, _pos: Vector2i, _faction: Faction, _surface: WorldSurface= null)-> UnitStack:
	if not _surface:
		_surface= get_main_surface()
		
	var unit_stack:= _surface.spawn_unit(_unit_data, _pos, _faction)
	add_stack_to_map(unit_stack)
	
	return unit_stack


func add_stack_to_map(_unit_stack: UnitStack)-> MapUnitStack:
	assert(_unit_stack)
	var map_obj: MapUnitStack= map_unit_scene.instantiate()
	# TODO per faction sub node
	units.add_child(map_obj)
	map_obj.init(_unit_stack)

	return map_obj

func render():
	render_surface(get_main_surface())

func render_surface(_surface: WorldSurface):
	pass

func get_main_surface()-> WorldSurface:
	return surfaces[0]
