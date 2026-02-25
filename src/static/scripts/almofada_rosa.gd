extends Node2D

var cursorStatus = Global.carimbo_standart

func _ready() -> void:
	pass

var isClosed: bool = false

func _on_button_pressed() -> void:
	Input.set_custom_mouse_cursor(Global.carimbo_rosa)
	
	if !isClosed:
		$"Animation rosa".play("almofada_rosa_fechando")
		isClosed = true
