extends Node

var path_save = "user://data.sav"

var characterPos: Vector2 = Vector2(139.0, 140.2222)

func save():
	var saveDict = {
		"characterPos": characterPos
	}
	var file = FileAccess.open(path_save, FileAccess.WRITE)
	if file:
		file.store_var(saveDict, true)
		file.close()

func load_data():
	
	if FileAccess.file_exists(path_save):
		var file = FileAccess.open(path_save, FileAccess.READ)
		var saveDict = file.get_var()
		file.close()
		
		if typeof(saveDict) == TYPE_DICTIONARY:
			characterPos = saveDict.get("characterPos", Vector2(139.0, 140.2222))
			var miguel = get_tree().current_scene.find_child("Miguel", true, false)
			if miguel:
				miguel.global_position = characterPos
		else:
			characterPos = Vector2(139.0, 140.2222)
	else:
		characterPos = Vector2(139.0, 140.2222)
