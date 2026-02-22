extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


	
func _on_sair__pressed():
	get_tree().quit()
func _on_voltar_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://src/static/scenes/tela_inicial.tscn")
func _on_reiniciar_pressed() -> void:
	pass

func _on_salvar_pressed() -> void:
	var miguel = get_parent().get_node("Miguel")
	if miguel:
		Global.characterPos = miguel.global_position
		Global.save()
