extends Control
@onready var line_edit: LineEdit = $LineEdit
@onready var label: Label = $LineEdit/Label

# Stänger av spelet
func _on_button_3_pressed() -> void:
	get_tree().quit()

# Startar spelet
func _on_button_2_pressed() -> void:
	Scoremanager.player_name = line_edit.text # Sparar användares namn
	get_tree().change_scene_to_file("res://Scen/main.tscn")
