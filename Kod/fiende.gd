extends CharacterBody2D

# Referens till spelaren som fienden ska följa
var spel_karaktär : Node2D

@onready var animation_enemy: AnimatedSprite2D = $AnimatedSprite2D


@export var Speed = 300.0
@export var health = 3.0
var killed_amount : int = 0

# Körs varje frame, kollar spelarens position och går mot den positionen
func _physics_process(delta: float) -> void:
	var direction =  global_position.direction_to(spel_karaktär.global_position)
	velocity = direction * Speed
	move_and_slide()
	_animation()

# Hanterar fiendens animationers beroende på vilken riktning den går
func _animation():
	
	#Om den går höger
	if velocity.x > 0:
		animation_enemy.flip_h = true
		animation_enemy.play("Go_left")
	# Om den går vänster
	elif velocity.x < 0:
		animation_enemy.flip_h = false
		animation_enemy.play("Go_left")
		
# Function för om fiende tar skada
func take_damage_shotgun():
	health -= 3
	
	if health <= 0:
		Scoremanager.add_score() # Lägger till ens score i högra hörnet
		queue_free() # Tar bort fienden
		
