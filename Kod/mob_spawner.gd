extends Node2D

@export var enemy: PackedScene
@export var Target: Node2D

#Slumpar random position där fiende skapas
var random_position = RandomNumberGenerator.new()


@onready var path_follow_2d: PathFollow2D = $"../SpelKaraktär/Path2D/PathFollow2D"
@onready var marker_2d: Marker2D = $"../SpelKaraktär/Path2D/PathFollow2D/Marker2D"


# Körs varje gång timern går ut
func _on_timer_timeout() -> void:
	print("Spawna enemy")
	Scoremanager.enemy_amount += 1
	path_follow_2d.progress = random_position.randi_range(0, 1060) # Välj slumpmässig position längs Path2D
	
	# Skapar fiende
	var ene = enemy.instantiate() 
	ene.spel_karaktär = Target
	
	ene.global_position = marker_2d.global_position
	add_child(ene)
	
