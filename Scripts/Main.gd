extends Node



# scene vars
const startscreen_path = "res://start_screen/StartScreen.tscn"
var current_scene_path
const gameover_path = "res://gameover_screen/GameOverScreen.tscn"


# life vars 
var lifes = 5

# score vars 
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():	
	get_tree().change_scene("res://start_screen/StartScreen.tscn")
	

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
	score += 1
	get_tree().call_group("HUD", "update_score", score)	
	if score % 5 == 0:
		increase_player_speed()

func reset_score() :
	score = 0

func increase_player_speed():
	get_tree().call_group("Player", "increase_move_speed")

# game over
func game_over():
	get_tree().change_scene(gameover_path)
	
