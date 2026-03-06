extends CharacterBody2D


@export var Speed = 300.0
@export var Acceleration = 2.0
@export var Friction = 12.0
@export var health = 100.0
@export var Damage_rate = 5.0
@export var Armour = 0.0

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $"../CanvasLayer/Timer"

var input_vector: Vector2
@onready var camera_2d: Camera2D = $Camera2D


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
	var overlapping_mobs = %HurtArea.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		var raw_damage = Damage_rate * overlapping_mobs.size() * delta
		
		if Armour > 0:
			var armour_damage = min(raw_damage, Armour)
			Armour -= armour_damage
			raw_damage -= armour_damage
			%Armour.value = Armour
		
		if raw_damage > 0:
			health -= raw_damage
			%Health_bar.value = health
		
		if health <= 0.0 and timer.is_stopped():
			Engine.time_scale = 0.5
			timer.start()
			
			
func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scen/game_over.tscn")

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
