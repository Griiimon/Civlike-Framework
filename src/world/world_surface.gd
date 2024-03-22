class_name WorldSurface

var name: String

var width: int
var height: int

var tiles: Array2D

var units: Array[Unit]


func _init(_name: String, _width: int, _height: int):
	name= _name
	width= _width
	height= _height


func generate_default_tiles():
	assert(not GameData.terrains.is_empty())
	
	tiles= Array2D.new(width, height)
	
	for x in width:
		for y in height:
			tiles.put(x, y, GameData.terrains[0])

func is_empty()-> bool:
	return not tiles