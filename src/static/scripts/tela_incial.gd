extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	pass


func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://src/static/scenes/main_scene.tscn")


func _on_nivel_pressed() -> void:
	pass # Replace with function body.


func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://src/static/scenes/creditos.tscn")


func _on_sair_pressed():
	get_tree().quit() 
