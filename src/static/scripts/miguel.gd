extends CharacterBody2D

const SPEED = 300.0
const GRAVITY = 800.0
const JUMP_VEL = -300.0


func _physics_process(delta: float) -> void:
	
	#porque caralhos eu preciso adicionar pra ele cair??
	#isso nem faz sentido dentro do plano cartesiano
	if !is_on_floor():
		velocity.y += GRAVITY * delta
		
	if Input.is_action_pressed("JUMP") && is_on_floor():
		velocity.y = JUMP_VEL
		
	var direction := Input.get_axis("LEFT", "RIGHT")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	
	move_and_slide()
