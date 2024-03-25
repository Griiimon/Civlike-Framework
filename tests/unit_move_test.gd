

static func run(_world: World, _game: Game):
	var faction= Faction.new()
	Diplomacy.add_faction(faction)
	
	var stack: UnitStack= _world.get_main_surface().spawn_unit(GameData.units_dict["settler"], Vector2i(1, 1), faction)
	_world.add_stack_to_map(stack)
	
	_world.render()
	var dir:= Vector2i(1, 0)
	assert(stack.can_move_direction(dir))

	stack.move(dir)
	

	Diplomacy.remove_faction(faction)
