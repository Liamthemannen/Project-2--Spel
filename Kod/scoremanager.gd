extends Node

var killed_amount = 0
var enemy_amount = 0
var player_name = ""

func add_score():
	killed_amount += 1

func reset_score():
	killed_amount = 0

func save_score():
	var leaderboard = load_leaderboard()
	leaderboard.append({"kills": killed_amount, "name": player_name})
	leaderboard.sort()
	leaderboard.reverse()
	var file = FileAccess.open("user://leaderboard.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(leaderboard))
	file.close()

func load_leaderboard() -> Array:
	if not FileAccess.file_exists("user://leaderboard.json"):
		return []
	var file = FileAccess.open("user://leaderboard.json", FileAccess.READ)
	var json = JSON.new()
	var result = json.parse(file.get_as_text())
	file.close()
	if result == OK:
		return json.data
	return []
