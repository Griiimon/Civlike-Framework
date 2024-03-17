extends World
class_name MyWorld3D

@export var flat_tile_scene: PackedScene

@onready var flat_map = $Flat
@onready var grid = $Grid

var flat_render_tiles: Array2D


func generate_flat():
	if not tiles:
		generate_default_tiles()
	
	flat_render_tiles= Array2D.new(width, height)

	for x in width:
		for y in height:
			var tile: FlatTile= flat_tile_scene.instantiate()
			tile.position= Vector3(x, 0, y)
			flat_map.add_child(tile)
			tile.set_material(tiles.read(x, y).flat_material)
	
	generate_grid()


func generate_grid():
	grid.position= (Vector3(width, 0, height) - Vector3(1, 0, 1))  / 2 
	grid.mesh.size= Vector2(width, height)
	grid.mesh.material.uv1_scale= Vector3(width, height, 1)

