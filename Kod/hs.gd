extends Control

@onready var vbox: VBoxContainer = $PanelContainer/VBoxContainer

func _ready():
	var leaderboard = Scoremanager.load_leaderboard()
	for entry in leaderboard:
		var label = Label.new()
		label.text = entry["name"] + " - " + str(int(entry["kills"])) + " kills"
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		vbox.add_child(label)
