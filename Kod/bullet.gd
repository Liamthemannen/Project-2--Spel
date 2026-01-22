extends Sprite2D
@onready var Shadow: Sprite2D = $shadow
@onready var AnimPlayer: AnimationPlayer = $AnimationPlayer
@onready var RayCast: RayCast2D = $RayCast2D


var speed: float = 120.0

func _ready() -> void:
	scale = Vector2(0.3, 0.3)

func _physics_process(delta: float) -> void:
	global_position += Vector2(1,0).rotated(rotation) * speed * delta
	Shadow.position = Vector2(-2,2).rotated(-rotation)
	
	if RayCast.is_colliding():
		var collider = RayCast.get_collider()
		if collider and !collider.is_in_group("player"):
			AnimPlayer.play("dissapear")
		
		

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "dissapear":
		queue_free()



func _on_distance_timeout_timeout() -> void:
	AnimPlayer.play("dissapear")
