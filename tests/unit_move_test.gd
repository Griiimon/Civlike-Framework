

static func run(_world: World, _game: Game):
	var faction= Diplomacy.get_player_faction()
	
	#var stack: UnitStack= _world.get_main_surface().spawn_unit(GameData.units_dict["settler"], Vector2i(1, 1), faction)
	#_world.add_stack_to_map(stack)

	var stack: UnitStack= _world.spawn_unit(GameData.units_dict["settler"], Vector2i(1, 1), faction)
	
	_world.render()
	var dir:= Vector2i(1, 0)
	assert(stack.can_move() and stack.can_move_direction(dir), str(stack.get_var("pumbaa")))

	stack.move(dir)
	
