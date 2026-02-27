extends CharacterBody2D
var direction := -1
var attacking := false
@onready var anim := $AnimatedSprite2D
@onready var attack_area := $AttackArea

func _ready():
	anim.play("normal")

func _physics_process(delta):

	if is_on_wall():
		direction *= -1
		anim.flip_h = direction > 0
	if attacking:
		anim.play("bater")
	else:
		anim.play("normal")

	if velocity.x == 0:
		anim.play("normal")
	move_and_slide()


func _on_hitb_ox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		attacking = true


func _on_hitb_ox_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
