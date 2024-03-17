extends Node
class_name Game

@export_dir var game_dir
@onready var world = $World


func _ready():
	GameData.load_data(game_dir)

	world.generate_flat()
