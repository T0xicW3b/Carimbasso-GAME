extends Node

const carimbo_standart = preload("res://src/Assets/Sprites/Cursores/carimbo_standart.png")
const carimbo_rosa = preload("res://src/Assets/Sprites/Cursores/carimbo_rosa.png")
const carimbo_vermelho = preload("res://src/Assets/Sprites/Cursores/carimbo_vermelho.png")
const carimbo_verde = preload("res://src/Assets/Sprites/Cursores/carimbo_verde.png")
const carimbo_azul = preload("res://src/Assets/Sprites/Cursores/carimbo_azul.png")
const carimbo_amarelo = preload("res://src/Assets/Sprites/Cursores/carimbo_amarelo.png")

var path_save = "user://data.sav"

var characterPos: Vector2 = Vector2(139.0, 218.0)

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
			characterPos = saveDict.get("characterPos", Vector2(139.0, 218.0))
			var miguel = get_tree().current_scene.find_child("Miguel", true, false)
			if miguel:
				miguel.global_position = characterPos
		else:
			characterPos = Vector2(139.0, 218.0)
	else:
		characterPos = Vector2(139.0, 218.0)
