extends Control

@onready var vbox: VBoxContainer = $VBoxContainer

func _ready():
	var leaderboard = Scoremanager.load_leaderboard()
	for entry in leaderboard:
		var label = Label.new()
		label.text = entry["name"] + " - " + str(int(entry["kills"])) + " kills"
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		vbox.add_child(label)


func _on_button_pressed() -> void:
	if FileAccess.file_exists("user://leaderboard.json"):
		DirAccess.remove_absolute("user://leaderboard.json")
