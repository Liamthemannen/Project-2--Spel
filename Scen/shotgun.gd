extends Area2D
@onready var shotgun: Sprite2D = $WeaponPivot/Shotgun

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	#if abs(rotation_degrees) > 90 and abs(rotation_degrees) < 270:
		#print(abs(rotation_degrees))
		#shotgun.flip_v = true	
	#else:
		#shotgun.flip_v = false
		#print(abs(rotation_degrees))

		
