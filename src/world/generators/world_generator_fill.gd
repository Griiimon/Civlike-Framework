extends WorldGenerator
class_name WorldGeneratorFill

func run(_world: World, _parameters: Dictionary):
	var tiles= Array2D.new(_world.width, _world.height)
	
	for x in _world.width:
		for y in _world.height:
			tiles.put(x, y, GameData.terrains_dict[_parameters.background])

	_world.get_main_surface().tiles= tiles
