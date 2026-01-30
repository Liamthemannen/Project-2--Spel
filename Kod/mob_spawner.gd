extends Node2D

@export var enemy: PackedScene
@export var Target: Node2D


func _on_timer_timeout() -> void:
	print("Spawna enemy")
	var ene = enemy.instantiate()
	ene.spel_karaktär = Target
	add_child(ene)
	
