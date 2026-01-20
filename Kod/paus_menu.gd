extends Control

@onready var paus_menu: Control = $"."
@onready var settings: Control = $"../Settings"


func _on_spela_pressed() -> void:
	Engine.time_scale = 1 # Gör spelet till normal hastighet
	paus_menu.visible = false 

func _on_options_pressed() -> void:
	# Stänger ner pausmenyn och öppnar inställningar
	paus_menu.visible = false
	settings.visible = true	


func _on_avsluta_pressed() -> void:
	get_tree().quit() # Stänger av spelet
