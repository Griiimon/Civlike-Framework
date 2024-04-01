extends MapUnitStack
class_name MapUnitStack2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var area: Area2D = %Area2D
@onready var collision_shape: CollisionShape2D = %CollisionShape2D

var blink_tween: Tween

func _ready():
	area.position= Vector2.ONE * Consts.TILE_SIZE / 2
	collision_shape.shape.size= Vector2.ONE * Consts.TILE_SIZE

func init(_unit_stack: UnitStack):
	super(_unit_stack)
	sprite.texture= units.get_first_display_unit().unit_data.texture
	
func set_position():
	var world: MyWorld2D= units.get_world() as MyWorld2D
	sprite.global_position= world.tilemap.to_local(units.pos * Consts.TILE_SIZE)

func get_position()-> Vector2:
	return sprite.global_position


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton:
		on_select()

func start_blinking():
	blink_tween= get_tree().create_tween()
	
	blink_tween.tween_interval(GameData.appearance.unit_blink_interval)
	blink_tween.tween_property(sprite, "modulate", Color.TRANSPARENT, 0.)
	blink_tween.tween_interval((1 - GameData.appearance.unit_blink_percentage) * GameData.appearance.unit_blink_interval)
	blink_tween.tween_property(sprite, "modulate", Color.WHITE, 0)
	blink_tween.set_loops(0)
	

func stop_blinking():
	blink_tween.kill()
