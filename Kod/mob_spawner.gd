extends Node2D

@export var enemy: PackedScene
@export var Target: Node2D
var random_position = RandomNumberGenerator.new()

func _on_timer_timeout() -> void:
	print("Spawna enemy")
	var ene = enemy.instantiate()
	ene.spel_karaktär = Target
	ene.position = Vector2(random_position.randf_range(-143, 146), random_position.randf_range(81, -81))
	if ene.position == Vector2(camera_2d.get_target_position())
	add_child(ene)
	
