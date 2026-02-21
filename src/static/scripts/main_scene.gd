extends Node2D

var isFullscreen: bool


const carimbo_standart = preload("res://src/Assets/Sprites/Cursores/carimbo_standart.png")
const carimbo_rosa = preload("res://src/Assets/Sprites/Cursores/carimbo_rosa.png")
const carimbo_vermelho = preload("res://src/Assets/Sprites/Cursores/carimbo_vermelho.png")
const carimbo_verde = preload("res://src/Assets/Sprites/Cursores/carimbo_verde.png")
const carimbo_azul = preload("res://src/Assets/Sprites/Cursores/carimbo_azul.png")
const carimbo_amarelo = preload("res://src/Assets/Sprites/Cursores/carimbo_amarelo.png")

var cursorStatus = carimbo_standart


#achei mais organizado deixar duas funções pra tela cheia
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("FULLSCREEN"):
		#o := em gdscript atribui o tipo pra variavel tambem (coisa de linguagem com tipagem dinamica)
		var mode := DisplayServer.window_get_mode()
		#fullscreen vai receber o bool contrario do estado da tela em fullscren
		isFullscreen = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
		
	toogle_fullscreen()
	
	toggle_cursor()
	
func ready():
	pause_menu.visible = false
	#cursorStatus = toggle_cursor()

func _process(_delta):
	
	Input.set_custom_mouse_cursor(cursorStatus)
	
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
		#print("ESC pressionado")
func toogle_fullscreen() -> void:
	if isFullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
@onready var pause_menu = get_node ("menu_de_pause")


func toggle_pause():
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused

#eu acho que essa é facil uma das funções mais feias que eu ja fiz pqp
#pelo menos funciona
func toggle_cursor():
	if Input.is_action_just_pressed("1"):
		Input.set_custom_mouse_cursor(carimbo_standart)
		cursorStatus = carimbo_standart
	elif Input.is_action_just_pressed("2"):
		Input.set_custom_mouse_cursor(carimbo_rosa)
		cursorStatus = carimbo_rosa
	elif Input.is_action_just_pressed("3"):
		Input.set_custom_mouse_cursor(carimbo_vermelho)
		cursorStatus = carimbo_vermelho
	elif Input.is_action_just_pressed("4"):
		Input.set_custom_mouse_cursor(carimbo_verde)
		cursorStatus = carimbo_verde
	elif Input.is_action_just_pressed("5"):
		Input.set_custom_mouse_cursor(carimbo_azul)
		cursorStatus = carimbo_azul
	elif Input.is_action_just_pressed("6"):
		Input.set_custom_mouse_cursor(carimbo_amarelo)
		cursorStatus = carimbo_amarelo
