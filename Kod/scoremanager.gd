extends Node
@onready var label: Label = $CanvasLayer/Label
var killed_amount = 0
var enemy_amount = 0

func add_score():
	killed_amount += 1
	label.text = str(killed_amount)
	
func _process(delta: float) -> void:
	if enemy_amount -= 1:
		add_score()
