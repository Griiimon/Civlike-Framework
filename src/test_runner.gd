extends Node
class_name TestRunner

@export var tests: Array[Script]

func _ready():
	late_ready.call_deferred()

func late_ready():
	for test in tests:
		test.run(get_parent().world)
