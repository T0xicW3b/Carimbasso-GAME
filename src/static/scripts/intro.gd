extends Node2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pular"):
		toggle_pular()

func toggle_pular():
	$fade.mudar_cena_fade("res://src/static/scenes/tela_inicial.tscn")
	#get_tree().change_scene_to_file("res://src/static/scenes/tela_inicial.tscn")


func _on_animated_sprite_2d_animation_finished() -> void:
	$fade.mudar_cena_fade("res://src/static/scenes/tela_inicial.tscn")
	#get_tree().change_scene_to_file("res://src/static/scenes/tela_inicial.tscn")
