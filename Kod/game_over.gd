extends CanvasLayer
@onready var spela: Button = $spela
@onready var avsluta: Button = $avsluta

func _on_timer_timeout() -> void:
	# Felhantering så musik-animationen inte förstörs
	spela.visible = true
	avsluta.visible = true


func _on_spela_pressed() -> void: # Återupptar spelet 
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Scen/main_menu.tscn")
	Scoremanager.reset_score()


func _on_avsluta_pressed() -> void:
	get_tree().quit() # Avslutar spelet
