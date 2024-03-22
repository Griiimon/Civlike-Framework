extends Node
class_name Game

@export_dir var game_dir
@onready var world = $World


func _ready():
	GameData.load_data(game_dir)
	
	world.init()
	late_ready.call_deferred()

func late_ready():
	world.generate_flat()
