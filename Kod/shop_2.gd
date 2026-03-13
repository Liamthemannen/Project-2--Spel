extends StaticBody2D

var shop_fönster
var anim: AnimationPlayer


# hämtar alla vägar till scenerna
func _ready() -> void:
	await get_tree().process_frame
	
	shop_fönster = get_node_or_null("shop_fönster")
	anim = shop_fönster.get_node_or_null("Anim")
	shop_fönster.visible = false
	
		
# om spelkaraktären går in i shopens area
func _on_in_area_check_body_entered(body: Node2D) -> void:
	if body.name == "SpelKaraktär":
		get_tree().paused = true
		if shop_fönster:
			shop_fönster.visible = true
		if anim:
			anim.play("transin")
