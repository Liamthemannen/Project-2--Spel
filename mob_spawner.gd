extends Node2D

@onready var enemy = preload("res://Scen/fiende.tscn")
@onready var fiender: Node2D = $fiender


func _on_timer_timeout() -> void:
	var ene = enemy.instantiate()
	ene.position = position
	get_parent().get_node("fiender")add_child(ene)
