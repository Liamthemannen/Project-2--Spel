extends Area2D
@export var SPEED = 1000.0
@export var RANGE = 1100.0

@export var label: Label

var killed_amount = 0

var travelled_distance = 0

# Körs varje frame, gör så skoten rör sig
func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	# Håller koll på hur långt projektilen har färdats
	travelled_distance += SPEED * delta
	
	# Ta bort skottet om den gått längre än tillåtet
	if travelled_distance > RANGE:
		queue_free() 

# Körs automatiskt när projektilen kolliderar med en kropp
func _on_body_entered(body: Node2D) -> void:
	queue_free() # Tar bort skottet 
	
	# Om objektet kan ta skada av shotgun, så tar den skada
	if body.has_method("take_damage_shotgun"):
		body.take_damage_shotgun()
