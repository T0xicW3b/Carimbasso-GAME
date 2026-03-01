extends Control

@onready var transition = $fade/transition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition.play("fade-out")
	await transition.animation_finished
	$fade.hide()



func _process(_delta) -> void:
	pass


func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://src/static/scenes/fase1.tscn")


func _on_nivel_pressed() -> void:
	get_tree().change_scene_to_file("res://src/static/scenes/menu_fases.tscn")


func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://src/static/scenes/creditos.tscn")


func _on_sair_pressed():
	get_tree().quit() 
