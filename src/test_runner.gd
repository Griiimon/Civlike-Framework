extends Node
class_name TestRunner

@export var enabled:= true
@export var tests: Array[GDScript]

func _ready():
	if not enabled:
		return
		
	late_ready.call_deferred()

func late_ready():
	await get_tree().process_frame
	
	assert(get_parent() is Game)
	var game: Game= get_parent()
	
	for test in tests:
		test.new().run(game.world, game)
