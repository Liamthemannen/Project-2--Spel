extends Node2D
@onready var paus_menu: Control = $CanvasLayer/Paus_menu

var spel_paus = false
#func _ready() -> void:
	#_spawn_mob()
	#_spawn_mob()
	#_spawn_mob()

#func _spawn_mob():
	#var new_enemy = preload("res://Scen/fiende.tscn").instantiate()
	#path_follow_2d.progress_ratio = randf()
	#new_enemy.global_position = path_follow_2d.global_position
	#add_child(new_enemy)
	#
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
