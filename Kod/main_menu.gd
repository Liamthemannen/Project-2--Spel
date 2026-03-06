extends Control
@onready var line_edit: LineEdit = $LineEdit
@onready var label: Label = $LineEdit/Label

#func _ready() -> void:
	#line_edit.text_submitted.connect(_on_LineEdit_text_entered)
#
#func _on_LineEdit_text_entered(new_text: String):
	#label.text
	
func _on_button_3_pressed() -> void:
	get_tree().quit()


func _on_button_2_pressed() -> void:
	Scoremanager.player_name = line_edit.text
	get_tree().change_scene_to_file("res://Scen/main.tscn")
