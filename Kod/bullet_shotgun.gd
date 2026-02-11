extends Area2D
@export var SPEED = 1000.0
@export var RANGE = 1100.0

@export var label: Label

var killed_amount = 0

var travelled_distance = 0

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage_shotgun"):
		body.take_damage_shotgun()

	
	
