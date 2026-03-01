extends CanvasLayer

@onready var transition = $transition

func mudar_cena_fade(caminhoCena):
	show()
	transition.play("fade")
	await transition.animation_finished
	get_tree().change_scene_to_file(caminhoCena)
