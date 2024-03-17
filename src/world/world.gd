extends Node3D
class_name World

@export var width: int= 20
@export var height: int= 20

@export var flat_tile_scene: PackedScene

@onready var flat_map = $Flat
@onready var grid = $Grid


var tiles: Array2D

var flat_render_tiles: Array2D


func _init():
	pass

func tick():
	pass

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


func generate_default_tiles():
	assert(not GameData.terrains.is_empty())
	
	tiles= Array2D.new(width, height)
	for x in width:
		for y in height:
			tiles.put(x, y, GameData.terrains[0])


func generate_grid():
	grid.position= Vector3(width, 0, height) / 2
	var material: StandardMaterial3D= grid.mesh.material
	material.uv1_scale= Vector3(width, 0, height)
