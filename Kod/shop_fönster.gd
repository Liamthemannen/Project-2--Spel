extends CanvasLayer


var shop_fönster

func _on_close_pressed() -> void:
	get_node("Anim").play("transout")
	self.visible = false
	get_tree().paused = false
	
