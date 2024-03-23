extends Node
class_name World

@export var width: int= 20
@export var height: int= 20

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

func render():
	render_surface(get_main_surface())

func render_surface(_surface: WorldSurface):
	pass

func get_main_surface()-> WorldSurface:
	return surfaces[0]
