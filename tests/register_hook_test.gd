

static func run(_world: World, _game: Game):
	Hooks.register(Hooks.Type.UNIT_STACK, Hooks.ScriptType.GDSCRIPT, "res://tests/scripting/unit_stack.gd", ["can_move"])
