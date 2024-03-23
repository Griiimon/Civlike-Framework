
static func run(_world: World):
	for unit_data in GameData.units:
		for terrain in GameData.terrains:
			prints(unit_data.get_display_name(), "can enter terrain", terrain.get_display_name(), "?", unit_data.can_enter_terrain(terrain))
	#world.get_main_surface().add_unit(
