extends CanvasLayer
var shotgun_script
var player


func _ready() -> void:
	shotgun_script = get_tree().root.get_node("Main/SpelKaraktär/Shotgun")
	player = get_tree().root.get_node("Main/SpelKaraktär")
var shop_fönster

func _on_close_pressed() -> void:
	get_node("Anim").play("transout")
	self.visible = false
	get_tree().paused = false

func _on_fire_rate_pressed() -> void:
	shotgun_script.timer.wait_time -= 0.1 

func _on_armour_pressed() -> void:
	player.Armour = min(player.Armour + 25.0, 100.0)
	player.get_node("%Armour").value = player.Armour
	
