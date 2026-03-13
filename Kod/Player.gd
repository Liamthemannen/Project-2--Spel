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

# Hämtar användares input 
func get_input():
	input_vector.x = Input.get_action_strength("Go_right") - Input.get_action_strength("Go_left")
	input_vector.y = Input.get_action_strength("Go_down") - Input.get_action_strength("Go_Up")
	return input_vector.normalized()
	

func _process(delta: float) -> void:
	var PlayerInput = get_input() 
	
	# Accelaration eller bromsning för att göra movement mer "smooth"
	if PlayerInput != Vector2.ZERO:
		velocity = lerp(velocity, PlayerInput * Speed, delta * Acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, Friction * delta)

	_animation(PlayerInput) # Uppdaterar animationen beroende på användarens inmatning
	move_and_slide() # Flyttar spelaren
	

func _physics_process(delta: float) -> void:
	var overlapping_mobs = %HurtArea.get_overlapping_bodies() # Kollar hur många fiender som rör spelaren
	if overlapping_mobs.size() > 0:
		var raw_damage = Damage_rate * overlapping_mobs.size() * delta

		# Ifall armour finns, så tar den skada först
		if Armour > 0:
			var armour_damage = min(raw_damage, Armour)
			Armour -= armour_damage
			raw_damage -= armour_damage
			%Armour.value = Armour
		
		# Om armour inte finns, försvinner health
		if raw_damage > 0:
			health -= raw_damage
			%Health_bar.value = health
		
		# Om spelaren dör så sänks spelhastigheten för visa att spelaren har dött
		if health <= 0.0 and timer.is_stopped():
			Engine.time_scale = 0.5
			timer.start()
			
# Efter dödstimern går ut sp sparas score och byter scen till "game over"
func _on_timer_timeout() -> void:
	Scoremanager.save_score()
	get_tree().change_scene_to_file("res://Scen/game_over.tscn")

# Spelarens animation beroende på input
func _animation(input):
	
	# Höger/vänster animation
	if input.x > 0:
		animation.flip_h = false
		animation.play("Höger")
	elif input.x < 0:
		animation.flip_h = true	
		animation.play("Höger")
	
	# Ner och upp animation
	if input.x == 0:
		if input.y > 0:
			animation.play("Neråt")
		elif input.y < 0:
			animation.play("Uppåt")
	# Om spelaren står stilla
	if input == Vector2.ZERO:
		animation.play("Stilla")
