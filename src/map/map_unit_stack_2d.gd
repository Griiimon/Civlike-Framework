extends MapUnitStack
class_name MapUnitStack2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var area: Area2D = %Area2D
@onready var collision_shape: CollisionShape2D = %CollisionShape2D


func _ready():
	area.position= Vector2.ONE * Consts.TILE_SIZE / 2
	collision_shape.shape.size= Vector2.ONE * Consts.TILE_SIZE

func init(_unit_stack: UnitStack):
	super(_unit_stack)
	sprite.texture= units.get_first_display_unit().unit_data.texture
	
func set_position():
	var world: MyWorld2D= units.get_world() as MyWorld2D
	sprite.global_position= world.tilemap.to_local(units.pos * Consts.TILE_SIZE)


func _on_area_2d_input_event(viewport, event, shape_idx):
	pass
