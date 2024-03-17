extends Node
class_name World

@export var width: int= 20
@export var height: int= 20


var tiles: Array2D



func _init():
	pass

func tick():
	pass



func generate_default_tiles():
	assert(not GameData.terrains.is_empty())
	
	tiles= Array2D.new(width, height)
	for x in width:
		for y in height:
			tiles.put(x, y, GameData.terrains[0])

