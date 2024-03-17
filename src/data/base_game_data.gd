class_name BaseGameData


static func parse_data_folder(path: String)-> Array:
	var result: Array
	var dir = DirAccess.open(path)
	
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				push_warning("Found directory: " + file_name)
			else:
				#var json= JSON.new()
				var file_path: String= path + "/" + file_name
				prints("JSON", file_path)
				print(JSON.parse_string(FileAccess.get_file_as_string(file_path)))
				#assert(json.get_error_line() == 0)
			file_name = dir.get_next()
	else:
		push_error("Couldn't open " + path)
	return result
