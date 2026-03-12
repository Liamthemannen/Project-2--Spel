extends Control

@onready var vbox: VBoxContainer = $VBoxContainer

func _ready():
	var leaderboard = Scoremanager.load_leaderboard()
	var lines = []
	for entry in leaderboard:
		lines.append(entry[1] + " - " + str(int(entry[0])) + " kills")
	var label = Label.new()
	label.text = "\n".join(lines)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vbox.add_child(label)


func _on_button_pressed() -> void:
	if FileAccess.file_exists("user://leaderboard.json"):
		DirAccess.remove_absolute("user://leaderboard.json")
