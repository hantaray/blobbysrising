extends Node



# scene vars
const startscreen_path = "res://start_screen/StartScreen.tscn"
const levelselection_path = "res://start_screen/LevelSelection.tscn"
var current_scene
var current_scene_path
var current_level = 1
const gameover_path = "res://gameover_screen/GameOverScreen.tscn"

#bool for pause button in game
var pause_button_pressed = false

# life vars 
var lifes = 5

# score vars 
var score = 0
var score_add = 1
var perfect_collect_counter = 0

var save_data

# Called when the node enters the scene tree for the first time.
func _ready():
#	load_game()
# warning-ignore:return_value_discarded
	# here change to test screen
	get_tree().change_scene(startscreen_path)
#	get_tree().change_scene("res://levels/UpDownMovement.tscn")


func reset_level_data():
	reset_lifes()
	reset_score()


# lifes funktions
func decrease_lives(life):
	lifes -= life
	update_lives_hud()
	if lifes <= 0:
		game_over()
		

func reset_lifes() :
	lifes = 5


func update_lives_hud():
	get_tree().call_group("HUD", "update_lives_hud", lifes)
	

# points functions
func increase_score():
	score += score_add
	var level = MainScript.current_scene
	
	update_highscore(level)
	check_level_goal_reached(level)
	
	get_tree().call_group("HUD", "update_score", score)
	if perfect_collect_counter % GamePlayData.perfect_collect_limit == 0:
		increase_score_add()
	if score % GamePlayData.increase_every_score == 0:
		increase_player_speed()
	if score % GamePlayData.add_life_every_score == 0:
		if lifes < 8:
			lifes += 1
			update_lives_hud()

func reset_score() :
	score = 0
	reset_perfect_collect()

func increase_score_add():
	score_add += 1
	update_perfcoll_label()
	
func add_perfect_collect_counter():
	perfect_collect_counter += 1

func reset_perfect_collect():
	score_add = 1
	perfect_collect_counter = 0
	update_perfcoll_label()
	
func update_perfcoll_label():
	get_tree().call_group("HUD", 'update_perfcoll_label', score_add)

func increase_player_speed():
	get_tree().call_group("Player", "increase_move_speed")

# game over
func game_over():
	get_tree().call_group("HUD", "showGameOverScreen")

func update_highscore(level):
	if level == "Subway":
		if score > GamePlayData.highscore_forest:
			GamePlayData.highscore_forest = score
	if level == "City":
		if score > GamePlayData.highscore_city:
			GamePlayData.highscore_city = score
	if level == "Street":
		if score > GamePlayData.highscore_street:
			GamePlayData.highscore_street = score
			
func check_level_goal_reached(level):
	if level == "Subway":
		if score >= GamePlayData.score_goal_forest and \
		!GamePlayData.score_goal_forest_reached:
			GamePlayData.score_goal_forest_reached = true
			GamePlayData.locked_city = false
#			get_tree().change_scene(MainScript.levelselection_path)
			get_tree().call_group("HUD", "showWinScreen")
	if level == "City":
		if score >= GamePlayData.score_goal_city and \
		!GamePlayData.score_goal_city_reached:
			GamePlayData.score_goal_city_reached = true
			GamePlayData.locked_street = false
#			get_tree().change_scene(MainScript.levelselection_path)
			get_tree().call_group("HUD", "showWinScreen")
	if level == "Street":
		if score >= GamePlayData.score_goal_street and \
		!GamePlayData.score_goal_street_reached:
			GamePlayData.score_goal_street_reached = true
#			get_tree().change_scene(MainScript.levelselection_path)
			get_tree().call_group("HUD", "showWinScreen")

func save_game():
	var save_game = File.new()
	save_game.open(GamePlayData.FILE_NAME, File.WRITE)
	
	save_data = {
		"score_goal_forest_reached" : GamePlayData.score_goal_forest_reached,
		"score_goal_street_reached" : GamePlayData.score_goal_street_reached,
		"score_goal_city_reached" : GamePlayData.score_goal_city_reached,
		"highscore_forest" : GamePlayData.highscore_forest,
		"highscore_street" : GamePlayData.highscore_street,
		"highscore_city" : GamePlayData.highscore_city,
		"locked_forest" : GamePlayData.locked_forest,
		"locked_street" : GamePlayData.locked_street,
		"locked_city" : GamePlayData.locked_city
	}
	# Store the save dictionary as a new line in the save file.
	save_game.store_line(to_json(save_data))
	save_game.close()
	
func load_game():
	var file = File.new()
	if file.file_exists(GamePlayData.FILE_NAME):
		file.open(GamePlayData.FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			GamePlayData.score_goal_forest_reached = data["score_goal_forest_reached"]
			GamePlayData.score_goal_street_reached = data["score_goal_street_reached"]
			GamePlayData.score_goal_city_reached = data["score_goal_city_reached"]
			GamePlayData.highscore_forest = data["highscore_forest"]
			GamePlayData.highscore_street = data["highscore_street"]
			GamePlayData.highscore_city = data["highscore_city"]
			GamePlayData.locked_forest = data["locked_forest"]
			GamePlayData.locked_street = data["locked_street"]
			GamePlayData.locked_city = data["locked_city"]
		else:
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")
