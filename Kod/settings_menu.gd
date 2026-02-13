extends Control
@onready var settings_menu: Control = $"."
@onready var paus_menu: Control = $"../Paus_menu"


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)



func _on_mute_knapp_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)


func _on_full_screen_control_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_button_pressed() -> void:
	settings_menu.visible = false
	paus_menu.visible = true	
