extends CharacterBody2D


const Speed = 300.0
const Acceleration = 2.0

var input_vector: Vector2

func get_input():
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input_vector.normalized()
	
func _process(delta: float) -> void:
	var PlayerInput = get_input()
	
	velocity = lerp(velocity, PlayerInput * Speed, delta * Acceleration)
	
	move_and_slide()
	
	
