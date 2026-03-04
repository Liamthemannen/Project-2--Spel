extends CanvasLayer
var shotgun_script

func _ready() -> void:
	# Hitta shotgun-scriptet
	shotgun_script = get_tree().root.get_node("Main/SpelKaraktär/Shotgun")

var shop_fönster

func _on_close_pressed() -> void:
	get_node("Anim").play("transout")
	self.visible = false
	get_tree().paused = false

func _on_fire_rate_pressed() -> void:
	shotgun_script.timer.wait_time -= 0.1 


		
