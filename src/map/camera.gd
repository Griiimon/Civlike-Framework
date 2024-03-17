extends Camera3D

@export var scroll_speed: float= 5.0 


func _process(delta):
	var vec= Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down")
	position+= Vector3(vec.x, 0, vec.y) * scroll_speed * delta
