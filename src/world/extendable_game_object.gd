class_name ExtendableGameObject

var vars:= {}


func set_var(_name: String, value: Variant):
	vars[_name]= value

func get_var(_name: String):
	assert(_name in vars)
	return vars[_name]

func __index(ref: LuaAPI, _index: String):
	return get_var(_index)

func __newindex(_ref: LuaAPI, _index: String, _value):
	set_var(_index, _value)
