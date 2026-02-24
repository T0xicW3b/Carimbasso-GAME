extends CharacterBody2D

const SPEED = 300.0
const GRAVITY = 600.0
const JUMP_VEL = -300.0

var stateMachine
var canJump = false

@export_category("Objects")
@export var animationTree: AnimationTree = null

func _ready() -> void:
	#stateMachine = animationTree["parameters/playback"]
	pass
func _physics_process(delta: float) -> void:
	
	#porque caralhos eu preciso adicionar pra ele cair??
	#isso nem faz sentido dentro do plano cartesiano
	if !is_on_floor():
		$AnimationPlayer.play("miguel_fall")
		velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("JUMP"):
		if is_on_floor() && canJump:
			$AnimationPlayer.play("miguel_jump")
			velocity.y = JUMP_VEL
	
	#pra fazer a animação de iddle ficar pra esquerda
	var direction := Input.get_axis("LEFT", "RIGHT")
	
	if direction != 0:
		velocity.x = direction * SPEED
		$Texture.flip_h = (direction < 0) #flip h se a direção for menor que 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	animate(direction)

func animate(direction):
	if !is_on_floor():
		if velocity.y  < 0:
			$AnimationPlayer.play("miguel_jump")
		else:
			$AnimationPlayer.play("miguel_fall")
	else:
		if direction != 0:
			$AnimationPlayer.play("miguel_run")
		else:
			$AnimationPlayer.play("miguel_iddle")


func _on_area_jump_body_entered(body: Node2D) -> void:
	if body == self:
		canJump = true
func _on_area_jump_body_exited(body: Node2D) -> void:
	if body == self:
		canJump = false
