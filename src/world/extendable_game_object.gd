class_name ExtendableGameObject

var vars:= {}


func set_var(_name: String, value: Variant):
	vars[_name]= value

func get_var(_name: String):
	assert(_name in vars)
	return vars[_name]

