extends Control
@onready var line_edit: LineEdit = $LineEdit
@onready var label: Label = $LineEdit/Label


func _on_button_3_pressed() -> void:
	get_tree().quit()


func _on_button_2_pressed() -> void:
	Scoremanager.player_name = line_edit.text
	get_tree().change_scene_to_file("res://Scen/main.tscn")
