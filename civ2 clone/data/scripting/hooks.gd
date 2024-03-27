class_name Hooks

enum Type { UNIT_STACK }
enum ScriptType { LUA, GDSCRIPT }

class Item:
	#var type: Type
	var script_type: ScriptType
	var script_path: String
	var functions: Array[String]
	
	func _init(_script_type: ScriptType, _script_path: String, _functions: Array[String]):
		script_type= _script_type
		script_path= _script_path
		functions= _functions


static var registered_hooks:= {}

static func set_hook(_type: Type, _function: String, _parameters: Array, _default_return= null):
	if registered_hooks.has(_type):
		var item: Item= registered_hooks[_type]
		if _function in item.functions:
			match item.script_type:
				ScriptType.GDSCRIPT:
					var script: GDScript= load(item.script_path)
					assert(script)
					var obj: Object= script.new()
					assert(obj)
					return obj.callv(_function, _parameters)


static func register(_type: Type, _script_type: ScriptType, _script_path: String, _functions: Array[String]):
	assert(not registered_hooks.has(_type))
	var item: Item= Item.new(_script_type, _script_path, _functions)
	registered_hooks[_type]= item
