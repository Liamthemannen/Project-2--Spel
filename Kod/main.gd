extends Node2D
@onready var paus_menu: Control = $CanvasLayer/Paus_menu
@export var Zombie: CharacterBody2D
@export var label: Label

var spel_paus = false
var killed_amount = 0



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
