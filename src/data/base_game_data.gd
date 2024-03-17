class_name BaseGameData

var name: String


static func parse_data_folder(path: String, script: Script)-> Array:
	var result:= []
	var dir = DirAccess.open(path)
	
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				push_warning("Found directory: " + file_name)
			else:
				var file_path: String= path + "/" + file_name
				prints("JSON", file_path)
				var json= JSON.new()
				var error= json.parse(FileAccess.get_file_as_string(file_path))
				if error != OK:
					push_error(str(json.get_error_line(), " ", json.get_error_message()))
					continue

				var data: Dictionary= json.data
				print(data)
				print()
				
				var obj= script.new()
				obj.name= file_name.split(".")[0]
				for key in data.keys():
					if key in obj:
						obj.set(key, data[key])
				
				obj.load_custom_data()
				
				result.append(obj)
				
			file_name = dir.get_next()
	else:
		push_error("Couldn't open " + path)
	
	
	return result


func load_custom_data():
	pass
