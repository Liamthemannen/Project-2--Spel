extends Area2D
@onready var shotgun: Sprite2D = $WeaponPivot/Shotgun
@onready var shooting_point: Marker2D = $WeaponPivot/Shotgun/ShootingPoint
var can_shoot := true	
@onready var timer: Timer = $Timer

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot") and can_shoot:
		shoot()
		can_shoot = false
		timer.start()

func shoot():
	const BULLET = preload("res://Scen/bullet_shotgun.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = shooting_point.global_position
	new_bullet.global_rotation = shooting_point.global_rotation
	shooting_point.add_child(new_bullet)


func _on_timer_timeout() -> void:
	can_shoot = true
