extends CharacterBody2D


@export var Speed = 300.0
@export var Acceleration = 2.0
@export var Friction = 12.0
@export var health = 100.0

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

var input_vector: Vector2


func get_input():
	input_vector.x = Input.get_action_strength("Go_right") - Input.get_action_strength("Go_left")
	input_vector.y = Input.get_action_strength("Go_down") - Input.get_action_strength("Go_Up")
	return input_vector.normalized()
	
func _process(delta: float) -> void:
	var PlayerInput = get_input()
	
	if PlayerInput != Vector2.ZERO:
		velocity = lerp(velocity, PlayerInput * Speed, delta * Acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, Friction * delta)

	_animation(PlayerInput)
	move_and_slide()
func _physics_process(delta: float) -> void:
	const Damage_rate = 5.0
	var overlapping_mobs = %HurtArea.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= Damage_rate * overlapping_mobs.size() * delta
		%Health_bar.value = health
		if health <= 0.0:
			print("Du är död!")

func _animation(input):
	if input.x > 0:
		animation.flip_h = false
		animation.play("Höger")
	elif input.x < 0:
		animation.flip_h = true	
		animation.play("Höger")
	
	if input.x == 0:
		if input.y > 0:
			animation.play("Neråt")
		elif input.y < 0:
			animation.play("Uppåt")
			
	if input == Vector2.ZERO:
		animation.play("Stilla")
