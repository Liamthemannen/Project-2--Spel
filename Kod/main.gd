extends Node2D
@onready var paus_menu: Control = $CanvasLayer/Paus_menu
@onready var path_follow_2d: PathFollow2D = $Path2D/PathFollow2D

func spawn_mob():
	%PathFollow2D.progress_ratio = randf()
	var new_mob = preload("res://Scen/fiende.tscn").instantiate()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


var spel_paus = false
# Called when the node enters the scene tree for the first time.
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Paus"): #and !settings.visible and !input_settings.visible
		spel_paus = !spel_paus 
		if spel_paus:
			# Pausa spelet, stoppar musiken och frys tiden
			Engine.time_scale = 0
			paus_menu.visible = true
		else:
			# Återtar spelet, avfryser tiden och startar musiken
			Engine.time_scale = 1
			paus_menu.visible = false
		
		# Felhanering så man ser till att inputen är hanterad
		get_tree().root.get_viewport().set_input_as_handled()
