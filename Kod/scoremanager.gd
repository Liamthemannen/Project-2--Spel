extends Node

var killed_amount = 0
var enemy_amount = 0
var player_name = ""

#adderar ett poäng per kill
func add_score():
	killed_amount += 1

#återställer scoren efter varje runda
func reset_score():
	killed_amount = 0

#sparar scoren till en json fil efter varje runda
func save_score():
	var leaderboard = load_leaderboard()
	leaderboard.append([killed_amount, player_name])
	# Samla in alla kills-värden i en separat lista och sortera dem
	var kills_list = []
	for entry in leaderboard:
		kills_list.append(int(entry[0]))
	kills_list.sort()
	kills_list.reverse()
	
	# Bygg om leaderboard i sorterad ordning baserat på kills
	var sorted_leaderboard = []
	var remaining = leaderboard.duplicate()
	for k in kills_list:
		for i in range(remaining.size()):
			if int(remaining[i][0]) == k:
				sorted_leaderboard.append(remaining[i])
				remaining.remove_at(i)
				break
	leaderboard = sorted_leaderboard
	var file = FileAccess.open("user://leaderboard.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(leaderboard))
	file.close()


#Hämtar json filen och visar scoreboard
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
