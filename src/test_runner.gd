extends Node
class_name TestRunner

@export var tests: Array[GDScript]

func _ready():
	late_ready.call_deferred()

func late_ready():
	for test in tests:
		test.new().run(get_parent().world)
