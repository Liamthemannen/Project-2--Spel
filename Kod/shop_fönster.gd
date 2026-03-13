extends CanvasLayer
var shotgun_script
var player

# hämtar vägarna till shotgun och player
func _ready() -> void:
	shotgun_script = get_tree().root.get_node("Main/SpelKaraktär/Shotgun")
	player = get_tree().root.get_node("Main/SpelKaraktär")
var shop_fönster


# när man trycker på close knappen stängs fönstret
func _on_close_pressed() -> void:
	get_node("Anim").play("transout")
	self.visible = false
	get_tree().paused = false


# När man trycker på firerate så förkortas timern med 10%
func _on_fire_rate_pressed() -> void:
	shotgun_script.timer.wait_time -= 0.1 


#När man trycker på armour så adderar den 25 armour till spelaren
func _on_armour_pressed() -> void:
	player.Armour = min(player.Armour + 25.0, 100.0)
	player.get_node("%Armour").value = player.Armour
	
