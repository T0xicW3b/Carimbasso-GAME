extends CharacterBody2D

const SPEED = 300.0
const GRAVITY = 600.0
const JUMP_VEL = -300.0

var stateMachine
var canJump = false
var sem_gravidade = false
var knockback = Vector2.ZERO

@export_category("Objects")
@export var animationTree: AnimationTree = null
@export var knockback_force = 300
@export var knockback_up = 200

func _ready() -> void:
	#stateMachine = animationTree["parameters/playback"]
	pass
func _physics_process(delta: float) -> void:
	
	#porque caralhos eu preciso adicionar pra ele cair??
	#isso nem faz sentido dentro do plano cartesiano
	if not sem_gravidade:
		$AnimationPlayer.play("miguel_fall")
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0
	
	if Input.is_action_just_pressed("JUMP"):
		if is_on_floor() && canJump:
			$AnimationPlayer.play("miguel_jump")
			velocity.y = JUMP_VEL
	
	#pra fazer a animação de iddle ficar pra esquerda
	var direction := Input.get_axis("LEFT", "RIGHT")
	if knockback.length() > 0:
		velocity = knockback
		knockback = knockback.move_toward(Vector2.ZERO, 1200 * delta)
	
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
func tomar_dano(pos_inimigo: Vector2):
	var dir = (global_position - pos_inimigo).normalized()

	knockback = Vector2(dir.x * knockback_force, -knockback_up)


func _on_area_jump_body_entered(body: Node2D) -> void:
	if body == self:
		canJump = true
func _on_area_jump_body_exited(body: Node2D) -> void:
	if body == self:
		canJump = false


func _on_area_leveza_body_entered(body):
	if body.is_in_group("player"):
		body.sem_gravidade = true


func _on_area_leveza_body_exited(body):
	if body.is_in_group("player"):
		body.sem_gravidade = false
