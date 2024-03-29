

static func run(_world: World, _game: Game):
	var faction= Diplomacy.get_player_faction()
	
	_world.spawn_unit(GameData.units_dict["settler"], Vector2i(1, 1), faction)
	
	_world.render()
	
	_game.start_turn()
