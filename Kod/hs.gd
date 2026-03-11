extends Control

@onready var vbox: VBoxContainer = $PanelContainer/VBoxContainer

func _ready():
	var leaderboard = Scoremanager.load_leaderboard()
	for entry in leaderboard:
		var label = Label.new()
		label.text = entry[1] + " - " + str(int(entry[0])) + " kills"
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		vbox.add_child(label)
