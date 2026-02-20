extends Node2D

"""var isFullscreen: bool

#achei mais organizado deixar duas funções pra tela cheia
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("FULLSCREEN"):
		#o := em gdscript atribui o tipo pra variavel tambem (coisa de linguagem com tipagem dinamica)
		var mode := DisplayServer.window_get_mode()
		#fullscreen vai receber o bool contrario do estado da tela em fullscren
		isFullscreen = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
		
	toogle_fullscreen()

func toogle_fullscreen() -> void:
	if isFullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)"""
@onready var pause_menu = get_node ("menu_de_pause")

func ready():
	pause_menu.visible = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
		print("ESC pressionado")
func toggle_pause():
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused
