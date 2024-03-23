class_name BaseGameData

var name: String
var raw_data: Dictionary

static func parse_data_folder(path: String, script: Script, default: String= "")-> Array:
	var result:= []
	var dir = DirAccess.open(path)
	
	var default_data:= {}
	if not default.is_empty():
		var tmp_data= parse_json(path + "/" + default + ".json")
		if tmp_data:
			default_data= tmp_data
	
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			var unique_name: String= file_name.split(".")[0]
			if dir.current_is_dir():
				pass
			elif unique_name == default:
				pass
			else:
				var file_path: String= path + "/" + file_name
				
				var obj= create_obj_from_json(unique_name, file_path, script, default_data)
				
				if obj:
					result.append(obj)
				
			file_name = dir.get_next()
	else:
		push_error("Couldn't open " + path)
	
	
	return result


static func create_obj_from_json(unique_name: String, file_path: String, script: Script, default_data: Dictionary):
	var json_result= parse_json(file_path)
	
	if json_result == null:
		return null
	
	var data: Dictionary= default_data.duplicate()
	data.merge(json_result, true)
	
	print(data)
	print()
	
	var obj= script.new()
	
	obj.name= unique_name
	obj.raw_data= data
	
	return  obj

static func parse_json(file_path: String):
	prints("JSON", file_path)
	var json= JSON.new()
	var error= json.parse(FileAccess.get_file_as_string(file_path))
	if error != OK:
		push_error(str(json.get_error_line(), " ", json.get_error_message()))
		return null

	assert(json.data is Dictionary)
	
	print(json.data)
	print()
	
	return json.data


func parse_data():
	for key in raw_data.keys():
		if key in self:
			if not is_key_handled_customly(key):
				set(key, raw_data[key])
	
	load_custom_data(raw_data)


func load_custom_data(_data: Dictionary):
	pass

func is_key_handled_customly(_key: String)-> bool:
	return false

func get_display_name()-> String:
	return name.capitalize()
