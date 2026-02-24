extends CharacterBody2D

const SPEED = 300.0
const GRAVITY = 800.0
const JUMP_VEL = -300.0

var canJump = false

func _physics_process(delta: float) -> void:
	
	#porque caralhos eu preciso adicionar pra ele cair??
	#isso nem faz sentido dentro do plano cartesiano
	if !is_on_floor():
		velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("JUMP"):
		if is_on_floor() && canJump:
			velocity.y = JUMP_VEL
	
	var direction := Input.get_axis("LEFT", "RIGHT")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()


func _on_area_jump_body_entered(body: Node2D) -> void:
	if body == self:
		canJump = true
func _on_area_jump_body_exited(body: Node2D) -> void:
	if body == self:
		canJump = false
