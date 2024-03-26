extends Node
class_name Game

@export_dir var game_dir
@onready var world = $World


func _ready():
	GameData.load_data(game_dir)
	
	world.init()
	late_ready.call_deferred()

func late_ready():
	#world.generate_flat()
	world.generate()
	world.render()

func _physics_process(_delta: float):
	var move:= Vector2i.ZERO
	
	if Input.is_action_just_pressed("move_up"):
		move.y= -1
	elif Input.is_action_just_pressed("move_up_right"):
		move.x= 1
		move.y= -1
	elif Input.is_action_just_pressed("move_right"):
		move.x= 1
	elif Input.is_action_just_pressed("move_down_right"):
		move.x= 1
		move.y= 1
	elif Input.is_action_just_pressed("move_down"):
		move.y= 1
	elif Input.is_action_just_pressed("move_down_left"):
		move.x= -1
		move.y= 1
	elif Input.is_action_just_pressed("move_left"):
		move.x= -1
	elif Input.is_action_just_pressed("move_up_left"):
		move.x= -1
		move.y= -1

	if move:
		world.player_units.send_command(PlayerUnitsManager.Command.MOVE, move)
