class_name UnitStack


var coords: Vector2i
var units: Array[Unit]
var surface: WorldSurface

func can_move_dir(dir: Vector2i)-> bool:
	var target_pos: Vector2i= coords + dir
	
	var terrain: TerrainData= surface.get_terrain_at(target_pos)
	
	
