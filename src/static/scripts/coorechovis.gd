extends CharacterBody2D
var direction := -1
var attacking := false
@onready var anim := $AnimatedSprite2D
@onready var attack_area := $hitbox

func _ready():
	pass
func _on_hitbox_body_entered(body):
	if body.is_in_group("player"):
		attacking = true
		body.tomar_dano(global_position)

func _physics_process(delta):

	if is_on_wall():
		direction *= -1
		anim.flip_h = direction > 0
	if attacking:
		anim.play("bater")
	else:
		anim.play("normal")

	move_and_slide()




func _on_hitbox_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		attacking = false
