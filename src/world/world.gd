extends Node
class_name World

@export var width: int= 20
@export var height: int= 20

var surfaces: Array[WorldSurface]


func init():
	surfaces.append(WorldSurface.new("default", width, height))
	
func tick():
	pass


func generate_flat():
	if surfaces[0].is_empty():
		surfaces[0].generate_default_tiles()
	
	render_surface(surfaces[0])

func render_surface(_surface: WorldSurface):
	pass
