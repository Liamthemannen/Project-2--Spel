extends CharacterBody2D
@onready var spel_karaktär: CharacterBody2D = $"../../SpelKaraktär"

@onready var animation_enemy: AnimatedSprite2D = $AnimatedSprite2D

@export var Speed = 300.0
@export var health = 3.0


func _physics_process(delta: float) -> void:
	var direction =  global_position.direction_to(spel_karaktär.global_position)
	velocity = direction * Speed
	move_and_slide()
	_animation()

	
func _animation():
	if velocity.x > 0:
		animation_enemy.flip_h = true
		animation_enemy.play("Go_left")
	elif velocity.x < 0:
		animation_enemy.flip_h = false
		animation_enemy.play("Go_left")
		
func take_damage():
	health -= 1
	
	if health <= 0:
		queue_free()
