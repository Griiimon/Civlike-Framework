extends MapUnitStack
class_name MapUnitStack2D

@onready var sprite: Sprite2D = $Sprite2D

func init(_unit_stack: UnitStack):
	super(_unit_stack)
	sprite.texture= units.get_first_display_unit().unit_data.texture
	
func set_position():
	var world: MyWorld2D= units.get_world() as MyWorld2D
	sprite.global_position= world.tilemap.to_local(units.pos * Consts.TILE_SIZE)
