extends Node

# dieser KommENTAR IST ZU TEST ZWECKEN

# scene vars
const startscreen_path = "res://start_screen/StartScreen.tscn"
const levelselection_path = "res://start_screen/LevelSelection.tscn"
var current_scene
var current_scene_path
var current_level = 1
var show_level = 1
const gameover_path = "res://gameover_screen/GameOverScreen.tscn"
# to compare score with highscore for medal view in gameover screen
var current_highscore = 0


#bool for pause button in game
var pause_button_pressed = false

# life vars 
var lifes = 5

# score vars 
var score = 0
var score_add = 1
var perfect_collect_counter = 0

var save_data

var levelRestart = false

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()
	set_audio()
	
# warning-ignore:return_value_discarded
	# here change to test screen
	get_tree().change_scene(startscreen_path)
#	get_tree().change_scene("res://levels/SubwayLevel.tscn")
#	get_tree().change_scene("res://levels/LaneMovement.tscn")
#	get_tree().change_scene("res://levels/RedistributionLevel.tscn")
#	get_tree().change_scene("res://levels/UpDownMovement.tscn")


func reset_level_data():
	reset_lifes()
	reset_score()
	reset_compare_score()


# lifes funktions
func decrease_lives(life):
	lifes -= life
	update_lives_hud()

func reset_lifes() :
	lifes = 5

func update_lives_hud():
	get_tree().call_group("HUD", "update_lives_hud", lifes)
	

# points functions
func increase_score():
	score += score_add
	var level = MainScript.current_scene
	
	update_highscore(level)
	get_tree().call_group("HUD", "update_score", score)
	check_level_goal_reached(level)
	
	if perfect_collect_counter % GamePlayData.perfect_collect_limit == 0:
		increase_score_add()
	if score >= GamePlayData.increase_speed_if_bigger_than:
		increase_player_speed()
		GamePlayData.increase_speed_if_bigger_than += GamePlayData.increase_speed_every_score
	if score >= GamePlayData.add_life_if_bigger_than:
		if lifes < GamePlayData.max_lifes:
			lifes += 1
			update_lives_hud()
			GamePlayData.add_life_if_bigger_than += GamePlayData.add_life_every_score

func reset_compare_score():
	GamePlayData.add_life_if_bigger_than = GamePlayData.add_life_every_score
	GamePlayData.increase_speed_if_bigger_than = GamePlayData.increase_speed_every_score

func reset_score() :
	score = 0
	reset_perfect_collect()

func increase_score_add():
	if score_add < 8:
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
		if score > GamePlayData.highscore_subway:
			GamePlayData.highscore_subway = score
	if level == "City":
		if score > GamePlayData.highscore_city:
			GamePlayData.highscore_city = score
	if level == "Street":
		if score > GamePlayData.highscore_street:
			GamePlayData.highscore_street = score
	if level == "Redis":
		if score > GamePlayData.highscore_redis:
			GamePlayData.highscore_redis = score
	if level == "Peace":
		if score > GamePlayData.highscore_peace:
			GamePlayData.highscore_peace = score
	if level == "Caring":
		if score > GamePlayData.highscore_caring:
			GamePlayData.highscore_caring = score

func check_game_over():
	if lifes <= 0:
		return true
	else:
		return false

func check_level_goal_reached(level):
	if level == "Subway":
		if score >= GamePlayData.score_goal_subway and \
		!GamePlayData.score_goal_subway_reached:
			GamePlayData.score_goal_subway_reached = true
			GamePlayData.locked_street = false
#			get_tree().change_scene(MainScript.levelselection_path)
			MainScript.show_level += 1
			get_tree().call_group("HUD", "showWinScreen")
	if level == "City":
		if score >= GamePlayData.score_goal_city and \
		!GamePlayData.score_goal_city_reached:
			GamePlayData.score_goal_city_reached = true
			GamePlayData.locked_redis = false
#			get_tree().change_scene(MainScript.levelselection_path)
			MainScript.show_level += 1
			get_tree().call_group("HUD", "showWinScreen")
	if level == "Street":
		if score >= GamePlayData.score_goal_street and \
		!GamePlayData.score_goal_street_reached:
			GamePlayData.score_goal_street_reached = true
#			get_tree().change_scene(MainScript.levelselection_path)
			get_tree().call_group("HUD", "showWinScreen")
	if level == "Redis":
		if score >= GamePlayData.score_goal_redis and \
		!GamePlayData.score_goal_redis_reached:
			GamePlayData.score_goal_redis_reached = true
			GamePlayData.locked_caring = false
#			get_tree().change_scene(MainScript.levelselection_path)
			MainScript.show_level += 1
			get_tree().call_group("HUD", "showWinScreen")
	if level == "Peace":
		if score >= GamePlayData.score_goal_peace and \
		!GamePlayData.score_goal_peace_reached:
			GamePlayData.locked_city = false
			GamePlayData.score_goal_peace_reached = true
#			get_tree().change_scene(MainScript.levelselection_path)
			MainScript.show_level += 1
			get_tree().call_group("HUD", "showWinScreen")
	if level == "Caring":
		if score >= GamePlayData.score_goal_caring and \
		!GamePlayData.score_goal_caring_reached:
			GamePlayData.locked_subway = false
			GamePlayData.score_goal_caring_reached = true
#			get_tree().change_scene(MainScript.levelselection_path)
			MainScript.show_level += 1
			get_tree().call_group("HUD", "showWinScreen")

func save_game():
	var save_game = File.new()
	save_game.open(GamePlayData.FILE_NAME, File.WRITE)
	
	save_data = {
		"score_goal_subway_reached" : GamePlayData.score_goal_subway_reached,
		"score_goal_street_reached" : GamePlayData.score_goal_street_reached,
		"score_goal_city_reached" : GamePlayData.score_goal_city_reached,
		"score_goal_redis_reached" : GamePlayData.score_goal_redis_reached,
		"score_goal_peace_reached" : GamePlayData.score_goal_peace_reached,
		"score_goal_caring_reached" : GamePlayData.score_goal_caring_reached,
		"highscore_subway" : GamePlayData.highscore_subway,
		"highscore_street" : GamePlayData.highscore_street,
		"highscore_city" : GamePlayData.highscore_city,
		"highscore_redis" : GamePlayData.highscore_redis,
		"highscore_peace" : GamePlayData.highscore_peace,
		"highscore_caring" : GamePlayData.highscore_caring,
		"locked_subway" : GamePlayData.locked_subway,
		"locked_street" : GamePlayData.locked_street,
		"locked_city" : GamePlayData.locked_city,
		"locked_redis" : GamePlayData.locked_redis,
		"locked_peace" : GamePlayData.locked_peace,
		"locked_caring" : GamePlayData.locked_caring,
		"music": GamePlayData.music,
		"sound": GamePlayData.sound,
		"showmanual": GamePlayData.show_manual
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
			GamePlayData.score_goal_subway_reached = data["score_goal_subway_reached"]
			GamePlayData.score_goal_street_reached = data["score_goal_street_reached"]
			GamePlayData.score_goal_city_reached = data["score_goal_city_reached"]
			GamePlayData.score_goal_redis_reached = data["score_goal_redis_reached"]
			GamePlayData.score_goal_peace_reached = data["score_goal_peace_reached"]
			GamePlayData.score_goal_caring_reached = data["score_goal_caring_reached"]
			GamePlayData.highscore_subway = data["highscore_subway"]
			GamePlayData.highscore_street = data["highscore_street"]
			GamePlayData.highscore_city = data["highscore_city"]
			GamePlayData.highscore_redis = data["highscore_redis"]
			GamePlayData.highscore_peace = data["highscore_peace"]
			GamePlayData.highscore_caring = data["highscore_caring"]
			GamePlayData.locked_subway = data["locked_subway"]
			GamePlayData.locked_street = data["locked_street"]
			GamePlayData.locked_city = data["locked_city"]
			GamePlayData.locked_redis = data["locked_redis"]
			GamePlayData.locked_peace = data["locked_peace"]
			GamePlayData.locked_caring = data["locked_caring"]
			GamePlayData.music = data["music"]
			GamePlayData.sound = data["sound"]
			GamePlayData.show_manual = data["showmanual"]
		else:
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")
		

func set_enemy_can_hit_timer():
	GamePlayData.enemy_can_hit = false
	yield(get_tree().create_timer(GamePlayData.INVULNERABLE_TIME), "timeout")
	GamePlayData.enemy_can_hit = true
	
	

func setMedalStartValue(score_goal):	
	GamePlayData.medal_goal_1 = score_goal
	GamePlayData.medal_goal_2 = GamePlayData.medal_goal_1 +  GamePlayData.medal_add
	GamePlayData.medal_goal_3 = GamePlayData.medal_goal_1 + GamePlayData.medal_add * 2
	GamePlayData.medal_goal_4 = GamePlayData.medal_goal_1 + GamePlayData.medal_add * 3
	GamePlayData.medal_goal_5 = GamePlayData.medal_goal_1 + GamePlayData.medal_add * 4
	GamePlayData.medal_goal_6 = GamePlayData.medal_goal_1 + GamePlayData.medal_add * 5
	GamePlayData.medal_goal_7 = GamePlayData.medal_goal_1 + GamePlayData.medal_add * 6
	GamePlayData.medal_goal_8 = GamePlayData.medal_goal_1 + GamePlayData.medal_add * 7
	GamePlayData.medal_goal_9 = GamePlayData.medal_goal_1 + GamePlayData.medal_add * 8
	GamePlayData.medal_goal_10 = GamePlayData.medal_goal_1 + GamePlayData.medal_add * 9
	GamePlayData.medal_goal_11 = GamePlayData.medal_goal_1 + GamePlayData.medal_add * 10
	GamePlayData.medal_goal_12 = GamePlayData.medal_goal_1 + GamePlayData.medal_add * 11


func set_audio():
	var master_sound = AudioServer.get_bus_index("Master")
	var music_sound = AudioServer.get_bus_index("Music")
	if GamePlayData.sound:
		AudioServer.set_bus_mute(master_sound, false)
	else:
		AudioServer.set_bus_mute(master_sound, true)
		
	if GamePlayData.music:
		AudioServer.set_bus_mute(music_sound, false)
	else:
		AudioServer.set_bus_mute(music_sound, true)
