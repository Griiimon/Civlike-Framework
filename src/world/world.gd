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


func generate_flat():
	if get_main_surface().is_empty():
		get_main_surface().generate_default_tiles()
	
	render_surface(get_main_surface())

func render_surface(_surface: WorldSurface):
	pass

func get_main_surface()-> WorldSurface:
	return surfaces[0]
