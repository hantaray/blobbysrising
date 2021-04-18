extends Node



# scene vars
const startscreen_path = "res://start_screen/StartScreen.tscn"
var current_scene
var current_scene_path
const gameover_path = "res://gameover_screen/GameOverScreen.tscn"


# life vars 
var lifes = 5

# score vars 
var score = 0
var score_add = 1
var perfect_collect_counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():	
# warning-ignore:return_value_discarded
	# here change to test screen
	get_tree().change_scene("res://start_screen/StartScreen.tscn")
#	get_tree().change_scene("res://levels/LaneMovement.tscn")


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
		if lifes <= 8:
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
	
# level goal reached
func level_goal_reached():
	GamePlayData.locked_street = false
	GamePlayData.score_goal_forest_reached = true
	get_tree().change_scene(MainScript.startscreen_path)
	
func update_highscore(level):
	if level == "Forest":
		if score > GamePlayData.highscore_forest:
			GamePlayData.highscore_forest = score
	if level == "Street":
		if score > GamePlayData.highscore_street:
			GamePlayData.highscore_street = score
	if level == "City":
		if score > GamePlayData.highscore_city:
			GamePlayData.highscore_city = score
			
func check_level_goal_reached(level):
	if level == "Forest":
		if score >= GamePlayData.score_goal_forest and !GamePlayData.score_goal_forest_reached:
			GamePlayData.score_goal_forest_reached = true
			GamePlayData.locked_street = false
			get_tree().change_scene(MainScript.startscreen_path)
	if level == "Street":
		if score >= GamePlayData.score_goal_street and !GamePlayData.score_goal_street_reached:
			GamePlayData.score_goal_street_reached = true
			GamePlayData.locked_city = false
			get_tree().change_scene(MainScript.startscreen_path)
	if level == "City":
		if score >= GamePlayData.score_goal_city and !GamePlayData.score_goal_city_reached:
			GamePlayData.score_goal_city_reached = true
			get_tree().change_scene(MainScript.startscreen_path)
	
